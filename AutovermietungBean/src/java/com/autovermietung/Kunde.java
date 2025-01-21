
package com.autovermietung;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.*;

@Entity
@Table(name = "kunden")
public class Kunde implements Serializable{
    int id;
    String name;
    
    public Kunde(){};

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getid() {
        return id;
    }

    public void setid(int kid) {
        this.id = kid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @Override
    public String toString(){
       return String.format("Kundennr: %d\tName: %s",getid(), name);
    }
    
}