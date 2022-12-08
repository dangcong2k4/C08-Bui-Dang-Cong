package controller;

import model.Customer;
import model.Facility;
import sevice.IFacilityService;
import sevice.impl.FacilityService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet",value = "/facility")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                save(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            case "search":
                searchFacility(request, response);
                break;
            case "edit":
                editFacility(request, response);
                break;
                
            default:
                listFacility(request, response);
                break;
        }
    }

    private void editFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOther = request.getParameter("description_other_convenience");
        Double poolArea;
        if(request.getParameter("pool_area")==null){
            poolArea = null;
        }else {
            poolArea= Double.parseDouble(request.getParameter("pool_area"));
        }
        Integer numberOfFloors;
        if(request.getParameter("number_of_floors")==null){
            numberOfFloors = null;
        }else {
            numberOfFloors = Integer.parseInt(request.getParameter("number_of_floors"));
        }
        String facilityFree = request.getParameter("facility_free");
        String rentType = request.getParameter("rent_type_id");
        String facilityType = request.getParameter("facility_type_id");
        Facility facility = new Facility(id,name,area,cost,maxPeople,standardRoom,descriptionOther,poolArea,numberOfFloors,facilityFree,rentType,facilityType);
        facilityService.isUpdate(facility);
        request.getRequestDispatcher("view/facility/edit.jsp").forward(request,response);
    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String descriptionOther = request.getParameter("descriptionOther");
        List<Facility> facilityList = this.facilityService.search(name,descriptionOther);
        request.setAttribute("facilityList",facilityList);
        request.setAttribute("searchName",name);
        request.setAttribute("searchDO",descriptionOther);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        facilityService.isDelete(id);
        List<Facility> facilityList = facilityService.findAllFacility();
        request.setAttribute("facilityList",facilityList);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listFacility(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.findAllFacility();
        request.setAttribute("facilityList",facilityList);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOther = request.getParameter("description_other_convenience");
        Double poolArea;
        if(request.getParameter("pool_area")==null){
            poolArea = null;
        }else {
            poolArea= Double.parseDouble(request.getParameter("pool_area"));
        }
        Integer numberOfFloors;
        if(request.getParameter("number_of_floors")==null){
            numberOfFloors = null;
        }else {
            numberOfFloors = Integer.parseInt(request.getParameter("number_of_floors"));
        }
        String facilityFree = request.getParameter("facility_free");
        String rentType = request.getParameter("rent_type_id");
        String facilityType = request.getParameter("facility_type_id");
        Facility facility = new Facility(name,area,cost,maxPeople,standardRoom,descriptionOther,poolArea,numberOfFloors,facilityFree,rentType,facilityType);
        facilityService.add(facility);
        response.sendRedirect("/facility");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;

            default:
                listFacility(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.selectFacility(id);
        request.setAttribute("facility",facility);
        try {
            request.getRequestDispatcher("view/facility/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/facility/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
