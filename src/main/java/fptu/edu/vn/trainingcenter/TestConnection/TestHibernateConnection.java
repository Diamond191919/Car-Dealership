/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.TestConnection;

/**
 *
 * @author Admin
 */
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class TestHibernateConnection {
    public static void main(String[] args) {
        // Tạo một đối tượng Configuration
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml"); // Load cấu hình từ file xml

        // Tạo ServiceRegistry
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                .applySettings(configuration.getProperties()).build();

        // Mở một session và thực hiện một thao tác
        try ( // Tạo SessionFactory từ ServiceRegistry
                SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry)) {
            // Mở một session và thực hiện một thao tác
            Session session = sessionFactory.openSession();
            Transaction transaction = null;
            try {
                transaction = session.beginTransaction();
                // Thực hiện các thao tác trên DB ở đây
                transaction.commit();
                System.out.println("✅ Connection established successfully");
            }catch (Exception e) {
                if (transaction != null) transaction.rollback();
            } finally {
                if (session != null) session.close();
            }
            // Đóng SessionFactory
        }
    }
}