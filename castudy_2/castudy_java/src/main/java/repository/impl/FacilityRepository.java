package repository.impl;

import model.Customer;
import model.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.*;
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
    private final String DELETE_FACILITY = "delete from facility where id = ?;";
    private final String SEARCH_FACILITY = "select facility.*,facility_type.`name` as name_type,rent_type.`name` as name_rent from facility \n" +
            "join facility_type on facility_type.id = facility.facility_type_id\n" +
            "join rent_type on rent_type.id = facility.rent_type_id"+
            " where facility.`name` like ? and facility.description_other_convenience like ?;";
    private final String UPDATE_FACILITY= "update facility set `name` = ?, area =?, cost =?, max_people =?, standard_room =?, description_other_convenience =?, pool_area =?, number_of_floors =?, facility_free =?, rent_type_id =?, facility_type_id =? where id = ?;";
    private final String SELECT_FACILITY_BY_ID = "select * from facility where id = ?;";
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

    @Override
    public void isDelete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_FACILITY);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Facility> search(String name, String descriptionOther) {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SEARCH_FACILITY);
            statement.setString(1,"%"+ name + "%" );
            statement.setString(2,"%"+ descriptionOther + "%" );
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                String name1 = resultSet.getString("name");
                int area = Integer.parseInt(resultSet.getString("area"));
                double cost = Double.parseDouble(resultSet.getString("cost"));
                int maxPeople = Integer.parseInt(resultSet.getString("max_people"));
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOther1 = resultSet.getString("description_other_convenience");
                Double poolArea = resultSet.getDouble("pool_area");
                Integer numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                String rentType = resultSet.getString("name_rent");
                String facilityType = resultSet.getString("name_type");
                facilityList.add(new Facility(name1,area,cost,maxPeople,standardRoom,descriptionOther1,poolArea,numberOfFloors,facilityFree,rentType,facilityType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean isUpdate(Facility facility) {
        boolean rowUpdated = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FACILITY);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOther());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setString(10, facility.getRentType());
            preparedStatement.setString(11, facility.getFacilityType());

            preparedStatement.setInt(12, facility.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public Facility selectFacility(int id) {
        Facility facility = null;

        try(Connection connection = BaseRepository.getConnectDB();
            PreparedStatement statement =connection.prepareStatement(SELECT_FACILITY_BY_ID);) {
            statement.setInt(1,id);
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                int area = Integer.parseInt(rs.getString("area"));
                double cost = Double.parseDouble(rs.getString("cost"));
                int maxPeople = Integer.parseInt(rs.getString("max_people"));
                String standardRoom = rs.getString("standard_room");
                String descriptionOther1 = rs.getString("description_other_convenience");
                Double poolArea = rs.getDouble("pool_area");
                Integer numberOfFloors = rs.getInt("number_of_floors");
                String facilityFree = rs.getString("facility_free");
                String rentType = rs.getString("rent_type_id");
                String facilityType = rs.getString("facility_type_id");
                facility = new Facility(id,name,area,cost,maxPeople,standardRoom,descriptionOther1,poolArea,numberOfFloors,facilityFree,rentType,facilityType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }
}
