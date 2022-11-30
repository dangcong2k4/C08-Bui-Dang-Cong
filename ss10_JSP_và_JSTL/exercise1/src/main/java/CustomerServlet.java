import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-01-20","Hà Nội","https://cdn.oneesports.gg/cdn-data/wp-content/uploads/2020/07/MLBB_Badang.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-01-2","Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsZ5M80J6d0yTYnZX7XYBJZn6mLLbdN-Metw&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-01-17","Nghệ An","https://cdn.sforum.vn/sforum/wp-content/uploads/2022/07/Fredrinn-2.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-01-22","Khánh Hòa","https://ecdn.game4v.com/g4v-content/uploads/2019/01/vale-mlbb.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-01-19","Hà Nội","https://storage.indoesports.com/images/31-rekomendasi-hero-terkuat-di-mobile-legends-2021-versi-patch-mlbb-1618-terbaru.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/customer.jsp").forward(request,response);
    }
}
