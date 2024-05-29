package com.javaweb.api.admin;

import com.javaweb.enums.Districts;
import com.javaweb.enums.TypeCode;
import com.javaweb.exception.DistrictException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController( value = "buildingAPIOfAdmin")
@RequestMapping("/admin/building")
public class BuildingAPI {
    @Autowired
    private IBuildingService buildingService;


    @PostMapping
    public BuildingDTO AddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        CheckDistrict(buildingDTO);
        buildingService.UpdateOrAdd(buildingDTO);
        return buildingDTO;
    }
    public void CheckDistrict(BuildingDTO buildingDTO){
        if(buildingDTO.getDistrict() == null || buildingDTO.getDistrict().equalsIgnoreCase("")){
            throw new DistrictException("Chưa khai báo quận của tòa nhà ");
        }

    }

    @DeleteMapping("/{ids}")
    public void DeleteBuiling(@PathVariable List<Long> ids ){
        buildingService.DeleteBuilding(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs (@PathVariable Long id ){
        ResponseDTO a = buildingService.listStaffs(id);
        return a;
    }

    @PostMapping("/assignment")
    public AssignmentBuildingDTO updateAssignmentBuilding (@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        buildingService.UpdateAssignmentBuilding(assignmentBuildingDTO);
        return assignmentBuildingDTO;
    }
}
