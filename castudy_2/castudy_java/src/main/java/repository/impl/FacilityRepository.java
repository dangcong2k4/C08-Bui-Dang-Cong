package repository.impl;

import model.Customer;
import model.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_ALL = "select facility.id,facility.`name`," +
            "facility.area,facility.cost, facility.max_people,facility.standard_room," +
            "facility.description_other_convenience,facility.pool_area,facility.number_of_floors," +
            "facility.facility_free,facility_type.`name` as name_type,rent_type.`name` as name_rent from facility \n" +
            "join facility_type on facility_type.id = facility.facility_type_id\n" +
            "join rent_type on rent_type.id = facility.rent_type_id;";
    private final String INSERT_VILLA = "insert into facility(`name`, area, cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, rent_type_id, facility_type_id)\n" +
            "value (?,?,?,?,?,?,?,?,?,?,?);";
    private final String INSERT_HOUSE = "insert into facility(`name`, area, cost, max_people, standard_room, description_other_convenience, number_of_floors, facility_free, rent_type_id, facility_type_id)\n" +
            "value (?,?,?,?,?,?,?,?,?,?);";
    private final String INSERT_ROOM = "insert into facility(`name`, area, cost, max_people, standard_room, description_other_convenience, facility_free, rent_type_id, facility_type_id)\n" +
            "value (?,?,?,?,?,?,?,?,?);";

    @Override
    public List<Facility> findAllFacility() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try(PreparedStatement ps = connection.prepareStatement(SELECT_ALL)){
            System.out.println(ps);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int area = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOther = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                String rentType = resultSet.getString("name_rent");
                String facilityType = resultSet.getString("name_type");
                Facility facility = new Facility(id,name,area,cost,maxPeople,standardRoom,descriptionOther,poolArea,numberOfFloors,facilityFree,rentType,facilityType );
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean add(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps = null;
        try {
            if (facility.getFacilityType().equals("1")){
                ps = connection.prepareStatement(INSERT_VILLA);
                ps.setString(1,facility.getName());
                ps.setInt(2,facility.getArea());
                ps.setDouble(3,facility.getCost());
                ps.setInt(4,facility.getMaxPeople());
                ps.setString(5,facility.getStandardRoom());
                ps.setString(6,facility.getDescriptionOther());
                ps.setDouble(7,facility.getPoolArea());
                ps.setInt(8,facility.getNumberOfFloors());
                ps.setString(9,facility.getFacilityFree());
                ps.setString(10,facility.getRentType());
                ps.setString(11,facility.getFacilityType());
            }else if (facility.getFacilityType().equals("2")){
                ps = connection.prepareStatement(INSERT_HOUSE);
                ps.setString(1,facility.getName());
                ps.setInt(2,facility.getArea());
                ps.setDouble(3,facility.getCost());
                ps.setInt(4,facility.getMaxPeople());
                ps.setString(5,facility.getStandardRoom());
                ps.setString(6,facility.getDescriptionOther());
                ps.setInt(7,facility.getNumberOfFloors());
                ps.setString(8,facility.getFacilityFree());
                ps.setString(9,facility.getRentType());
                ps.setString(10,facility.getFacilityType());
            }else {
                ps = connection.prepareStatement(INSERT_ROOM);
                ps.setString(1,facility.getName());
                ps.setInt(2,facility.getArea());
                ps.setDouble(3,facility.getCost());
                ps.setInt(4,facility.getMaxPeople());
                ps.setString(5,facility.getStandardRoom());
                ps.setString(6,facility.getDescriptionOther());
                ps.setString(7,facility.getFacilityFree());
                ps.setString(8,facility.getRentType());
                ps.setString(9,facility.getFacilityType());
            }

            return ps.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
