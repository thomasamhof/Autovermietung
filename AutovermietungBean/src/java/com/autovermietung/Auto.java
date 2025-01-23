package com.autovermietung;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="autos")
public class Auto implements Serializable {

    int id;
    String bez;
    String Farbe;
    Kunde kunde;

    public Auto() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "AutoID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBez() {
        return bez;
    }

    public void setBez(String bez) {
        this.bez = bez;
    }

    public String getFarbe() {
        return Farbe;
    }

    public void setFarbe(String Farbe) {
        this.Farbe = Farbe;
    }
    
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE}
      , fetch = FetchType.EAGER)
    public Kunde getKunde() {
        return kunde;
    }

    public void setKunde(Kunde kunde) {
        this.kunde = kunde;
    }
    
    @Override
    public String toString() {
        return String.format("Bez: %s\tFarbe: %s\tKunde: %s", bez, Farbe, kunde);
    }

}
