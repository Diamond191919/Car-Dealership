/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.CarDAO;
import fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl.CarDAOImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.CarService;
import fptu.edu.vn.trainingcenter.Model.Car;

import java.util.List;


/**
 *
 * @author Diamond1
 */
public class CarServiceImpl implements CarService {

    private CarDAO carDAO = new CarDAOImpl();

    @Override
    public List<Car> getAvailableCars() {
        return carDAO.getAvailableCars();
    }
}
