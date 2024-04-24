package com.javaweb.controller.admin;




import com.javaweb.enums.Districts;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Security;
import java.util.ArrayList;
import java.util.List;

@RestController(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IBuildingService iBuildingService;

    @Autowired
    private IUserService userService;

    @Autowired
    private BuildingRepository buildingRepository;



    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildinglist ( @ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
        // xuong DB lay len
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            buildingSearchRequest.setStaffId(SecurityUtils.getPrincipal().getId());
        }
        List<BuildingSearchResponse> list= iBuildingService.findAll(buildingSearchRequest , PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        BuildingSearchRequest a = new BuildingSearchRequest();
        a.setListResult(list);
        a.setTotalItems(list.size());
        mav.addObject("buildingList",a);
        mav.addObject("ListStaffs",userService.getStaffs());
        mav.addObject("districts", Districts.type());
        mav.addObject("listType", TypeCode.typecode());
        return mav;
    }

    @RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingedit (@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", Districts.type());
        mav.addObject("listType", TypeCode.typecode());
        mav.addObject("buildingEdit",buildingDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingedit (@PathVariable Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = iBuildingService.getBuildingDTO(id);
        mav.addObject("buildingEdit",buildingDTO);
        mav.addObject("districts", Districts.type());
        mav.addObject("listType", TypeCode.typecode());
        return mav;
    }

}
