package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;


@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public static String CheckQuerryNoraml (BuildingSearchRequest buildingSearchRequest) {
        StringBuilder x = new StringBuilder("");
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for(Field item : fields) {
                item.setAccessible(true);
                String key = item.getName();
                if(!key.equals("staffId") && !key.equals("typeCode")
                        && !key.startsWith("area")&& !key.startsWith("rentPrice")) {
                    Object value = item.get(buildingSearchRequest);
                    if (value != null && !value.toString().equalsIgnoreCase("")) {
                        if (item.getType().getName().equals("java.lang.Integer")||item.getType().getName().equals("java.lang.Long")){
                            x.append(" and b." + key + " = " + value + " ");
                        }
                        else if (item.getType().getName().equals("java.lang.String")) {
                            x.append( " and b." + key + " like '%" + value+"%' ");
                        }
                    }
                }

            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }

        return x.toString();
    }
    public static String CheckQuerrySpecial (BuildingSearchRequest buildingSearchRequest) {
        StringBuilder x = new StringBuilder("");
        Long Staffid =buildingSearchRequest.getStaffId();
        if(Staffid != null ) {
            x.append(" and assignmentbuilding.staffid =  " +Staffid );
        }
        List<String> typeCode = buildingSearchRequest.getTypeCode();
        if (typeCode != null && typeCode.size() != 0) {
            x.append(" and ( ");
            String str = typeCode.stream().map(it -> " b.type like '%" + it +"%' ").collect(Collectors.joining(" or "));
            x.append(str);
            x.append(" ) ");
        }


        Long areaTo = buildingSearchRequest.getAreaTo();
        Long areaFrom = buildingSearchRequest.getAreaFrom();
        if(areaTo != null ||areaFrom != null) {
            if(areaFrom != null) {
                x.append(" and rentarea.value >= " + areaFrom);
            }
            if(areaTo != null) {
                x.append(" and rentarea.value <= " + areaTo);
            }
        }
        Long priceTo = buildingSearchRequest.getRentPriceTo();
        Long priceFrom =  buildingSearchRequest.getRentPriceFrom();
        if(priceTo != null ||priceFrom != null) {
            if(priceFrom != null) {
                x.append(" and b.rentprice >= " + priceFrom);
            }
            if(priceTo != null) {
                x.append(" and b.rentprice <= " + priceTo);
            }
        }
        return x.toString();
    }

    public static String CheckJoin (BuildingSearchRequest buildingSearchRequest) {
        StringBuilder x = new StringBuilder("");
        Long Staffid =buildingSearchRequest.getStaffId();
        if(Staffid != null) {
            x.append("inner JOIN assignmentbuilding ON b.id = assignmentbuilding.buildingid ");
        }
        Long areaTo = buildingSearchRequest.getAreaTo();
        Long areaFrom = buildingSearchRequest.getAreaFrom();
        if( areaTo != null ||areaFrom != null ) {
            x.append("inner JOIN rentarea ON b.id = rentarea.buildingid ");
        }
        return x.toString();
    }
    @Override
    public List<BuildingEntity> findBuilding(BuildingSearchRequest buildingSearchRequest , Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        sql.append(CheckJoin(buildingSearchRequest));
        sql.append("where 1=1 ");
        sql.append(CheckQuerrySpecial(buildingSearchRequest));
        sql.append(CheckQuerryNoraml(buildingSearchRequest));
        sql.append(" group by  b.id ");
        Query quey = entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
        List<BuildingEntity> arr = quey.getResultList();
        return quey.getResultList();
    }
   
}
