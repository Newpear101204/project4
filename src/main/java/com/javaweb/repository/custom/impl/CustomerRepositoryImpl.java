package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public  static String CheckQuery (CustomerSearchRequest customerSearchRequest){
        StringBuilder x = new StringBuilder("");
        try{
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields();
            for (Field it : fields){
                it.setAccessible(true);
                String key = it.getName();
                if(key != "staffId"){
                    Object value = it.get(customerSearchRequest);
                    if(value != null && !value.toString().equalsIgnoreCase("")){
                        x.append(" and customer." + key + " like '%" + value+"%' ");
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return x.toString();
    }

    public static String  StringCheckStaff( CustomerSearchRequest customerSearchRequest){
        StringBuilder x = new StringBuilder("");
        if(customerSearchRequest.getStaffId() != null){
            x.append(" and assignmentcustomer.staffid = " + customerSearchRequest.getStaffId() + " ");
        }
        return x.toString();
    }

    public static String checkJoin (CustomerSearchRequest customerSearchRequest){
        StringBuilder x = new StringBuilder("");
        if(customerSearchRequest.getStaffId() != null){
            x.append(" inner JOIN assignmentcustomer ON customer.id = assignmentcustomer.customerid ");
        }
        return x.toString();
    }
    @Override
    public List<CustomerEntity> listCustomer(CustomerSearchRequest customerSearchRequest) {
        StringBuilder sql =  new StringBuilder("SELECT * FROM CUSTOMER ");

        sql.append(checkJoin(customerSearchRequest));
        sql.append(" WhERE 1 = 1 ");
        sql.append(CheckQuery(customerSearchRequest));
        sql.append(StringCheckStaff(customerSearchRequest));
        sql.append(" and  is_active = 1 ");
        Query quey = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return quey.getResultList();
    }
}
