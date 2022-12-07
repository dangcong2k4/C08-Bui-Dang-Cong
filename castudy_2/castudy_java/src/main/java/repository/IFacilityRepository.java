package repository;

import model.Customer;
import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    //đổ ra list
    List<Facility> findAllFacility();
    //thêm mới
    boolean add(Facility facility);
}
