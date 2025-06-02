/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl;

/**
 *
 * @author Diamond1
 */

import fptu.edu.vn.trainingcenter.Diamon.DAO.PartsDAO;
import fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl.PartsDAOImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.PartsService;
import fptu.edu.vn.trainingcenter.Model.Parts;

import java.util.List;

public class PartsServiceImpl implements PartsService {

    private PartsDAO partsDAO = new PartsDAOImpl();

    @Override
    public List<Parts> getAllParts() {
        return partsDAO.getAllParts();
    }

    @Override
    public List<Parts> getByPartsName(String partName) {
        return partsDAO.getByPartsName(partName);
    }
    
    @Override
    public Parts getById(int partID) {
        return partsDAO.getById(partID);
    }

    @Override
    public boolean addPart(Parts part) {
        return partsDAO.addPart(part);
    }

    @Override
    public boolean updatePart(Parts part) {
        return partsDAO.updatePart(part);
    }

    @Override
    public boolean deletePart(int id) {
        return partsDAO.deletePart(id);
    }
}
