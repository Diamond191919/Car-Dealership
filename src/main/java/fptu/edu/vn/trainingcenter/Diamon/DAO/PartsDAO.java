/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO;

/**
 *
 * @author Diamond1
 */

import fptu.edu.vn.trainingcenter.Model.Parts;

import java.util.List;

public interface PartsDAO {

    List<Parts> getAllParts();

    List<Parts> getByPartsName(String partName);

    boolean addPart(Parts part);

    boolean updatePart(Parts part);

    boolean deletePart(int id);
    
    Parts getById(int id);
}
