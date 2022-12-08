package sevice.impl;

import model.Customer;
import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import sevice.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private final IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAllFacility() {
        return facilityRepository.findAllFacility();
    }

    @Override
    public boolean add(Facility facility) {
        return facilityRepository.add(facility);
    }

    @Override
    public void isDelete(int id) {
        facilityRepository.isDelete(id);
    }

    @Override
    public List<Facility> search(String name, String descriptionOther) {
        return facilityRepository.search(name,descriptionOther);
    }

    @Override
    public boolean isUpdate(Facility facility) {
        return facilityRepository.isUpdate(facility);
    }

    @Override
    public Facility selectFacility(int id) {
        return facilityRepository.selectFacility(id);
    }
}
