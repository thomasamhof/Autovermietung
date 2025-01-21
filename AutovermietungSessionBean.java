/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.autovermietung;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.jws.WebService;
import javax.persistence.*;

/**
 *
 * @author TAmhof
 */
@WebService
@Stateless
public class AutovermietungSessionBean implements AutovermietungSessionBeanRemote {
@PersistenceContext(unitName="AutovermietungPU")
   private EntityManager entityManager;    

    public AutovermietungSessionBean(){
    }
    
    public void verleiheAuto(int i, Kunde kunde){
        Auto auto=entityManager.find(Auto.class, i);
        auto.setKunde(kunde);
        entityManager.merge(auto);
    }
    
    public void addAuto(Auto auto){
        entityManager.merge(auto);
    }
    
    public void loescheAuto(int i){
        entityManager.remove(entityManager.find(Auto.class, i));
    }
    
    public List<Auto> getAutos(){
      return  entityManager.createQuery("FROM Auto").getResultList();
    }
    
    public Auto getAuto(int i){
      return  entityManager.find(Auto.class, i);
    }
    
    public void addKunde(Kunde kunde){
        entityManager.persist(kunde);
    }
    
    public List<Kunde> getKunden(){
        return  entityManager.createQuery("From Kunde").getResultList();
    }
    
    public Kunde getKunde(int i){
      return  entityManager.find(Kunde.class, i);
    }
}
