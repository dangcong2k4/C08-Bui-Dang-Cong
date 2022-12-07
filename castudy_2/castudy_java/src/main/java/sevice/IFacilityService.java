package sevice;

import model.Customer;
import model.Facility;

import java.util.List;

public interface IFacilityService {
    //đổ ra list
    List<Facility> findAllFacility();
    //thêm mới
    boolean add(Facility facility);
}
