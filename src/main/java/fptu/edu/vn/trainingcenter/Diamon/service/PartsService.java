/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service;

/**
 *
 * @author Diamond1
 */

import fptu.edu.vn.trainingcenter.Model.Parts;

import java.util.List;

public interface PartsService {

    List<Parts> getAllParts();

    List<Parts> getByPartsName(String partName);
    
    Parts getById(int id);

    boolean addPart(Parts part);

    boolean updatePart(Parts part);

    boolean deletePart(int id);
}
