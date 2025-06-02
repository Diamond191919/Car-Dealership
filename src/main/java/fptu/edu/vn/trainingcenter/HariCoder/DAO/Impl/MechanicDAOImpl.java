/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl;

/**
 *
 * @author Admin
 */
import fptu.edu.vn.trainingcenter.HariCoder.DAO.IMechanicDAO;
import fptu.edu.vn.trainingcenter.Model.Service;
import fptu.edu.vn.trainingcenter.Utils.HibernateUtils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class MechanicDAOImpl implements IMechanicDAO {
    @Override
    public boolean createMechanicService(Service service) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            service.setStatus("active");
            session.save(service);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    @Override
    public Service getServiceById(Long serviceID) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            return session.get(Service.class, serviceID);
        } finally {
            session.close();
        }
    }

    @Override
    public boolean updateMechainicService(Service service) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            // Trước khi cập nhật, kiểm tra dịch vụ có tồn tại không
            Service existingService = getServiceById(service.getServiceID());
            if (existingService != null) {
                // Dịch vụ tồn tại, thực hiện cập nhật
                session.update(service);
                transaction.commit();
                return true;
            } else {
                System.out.println("Service not found!");
                return false;
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean deleteMechanicService(Long serviceID) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            // Trước khi xóa, tìm kiếm dịch vụ theo ID
            Service service = getServiceById(serviceID);
            if (service != null) {
                // Thay đổi trạng thái từ "active" sang "inactive" thay vì xóa
                service.setStatus("inactive");
                session.update(service);  // Cập nhật trạng thái dịch vụ
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Service> getAllServices() {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            String hql = "FROM Service";
            Query<Service> query = session.createQuery(hql, Service.class);
            return query.list();
        } finally {
            session.close();
        }
    }
    @Override
    public List<Service> findServicesByName(String keyword) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            String hql = "FROM Service WHERE service_name LIKE :keyword";
            Query<Service> query = session.createQuery(hql, Service.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.list();
        } finally {
            session.close();
        }
    }

    @Override
    public List<Service> getAllActiveService() {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            String hql = "FROM Service WHERE status = 'active'";
            Query<Service> query = session.createQuery(hql, Service.class);
            return query.list();
        } finally {
            session.close();
        }
    }
    
    @Override
    public List<Service> getAllInactiveService() {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            String hql = "FROM Service WHERE status = 'inactive'";
            Query<Service> query = session.createQuery(hql, Service.class);
            return query.list();
        } finally {
            session.close();
        }
    }

    @Override
    public int getTotalMechanicServices(){
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            String hql = "SELECT COUNT(*) FROM Service";
            Query<Long> query = session.createQuery(hql, Long.class);
            return query.getSingleResult().intValue();
        } finally {
            session.close();
        }
    }
}
