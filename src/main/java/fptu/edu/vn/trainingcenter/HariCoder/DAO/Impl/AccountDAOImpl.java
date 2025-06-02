/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl;

/**
 *
 * @author Admin
 */
import fptu.edu.vn.trainingcenter.HariCoder.DAO.IAccountDAO;
import fptu.edu.vn.trainingcenter.Model.Account;
import fptu.edu.vn.trainingcenter.Utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AccountDAOImpl implements IAccountDAO {

    @Override
    public boolean updateProfileAccount(Account account) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        try {
            Account existingAccount = getAccountById(account.getId());
            if (existingAccount != null) {
                existingAccount.setName(account.getName());
                existingAccount.setPhone(account.getPhone());
                existingAccount.setSex(account.getSex());
                existingAccount.setAddress(account.getAddress());

                session.saveOrUpdate(existingAccount);
                transaction.commit();
                return true;
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
        return false;
    }

    @Override
    public Account getAccountById(Long accountId) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            String hql = "FROM Account WHERE id = :accountId";
            Query<Account> query = session.createQuery(hql, Account.class);
            query.setParameter("accountId", accountId);
            Account account = query.uniqueResult();
            transaction.commit();
            return account;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    @Override
    public Account checkAccountBeforeLogin(String email, String password) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Account account = null;
        try {
            String hql = "FROM Account WHERE email = :email AND password = :password";
            Query<Account> query = session.createQuery(hql, Account.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            account = query.uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return account;
    }

    @Override
    public String getRoleIdByName(String roleName) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        String roleId = null;
        try {
            String hql = "SELECT r.roleID FROM Role r WHERE r.name = :name";
            Query<String> query = session.createQuery(hql, String.class);
            query.setParameter("name", roleName);
            roleId = query.uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return roleId;
    }


    private Long generateAccountId() {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            Query<Long> query = session.createQuery("SELECT MAX(id) FROM Account WHERE id LIKE '11%'", Long.class);
            Long lastId = query.uniqueResult();
            if (lastId != null) {
                return lastId + 1;
            } else {
                return Long.parseLong("11000");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Long.parseLong("11000"); // Return default start id if any exception occurs
        }
    }

    @Override
    public boolean createAccount(Account account) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            // Generate a new account ID
            Long newAccountId = generateAccountId();

            // Check if the generated account ID already exists
            Account checkExistAccount = (Account) session.get(Account.class, newAccountId);
            boolean idExists = checkExistAccount != null;

            if (idExists) {
                System.out.println("Account ID already exists in the database.");
                return false;
            }
            account.setId(newAccountId);
            account.setStatus("active");
            account.setRoleID("2");
            session.save(account);
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

}
