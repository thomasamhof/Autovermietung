
package com.autovermietung;

import java.util.List;
import javax.ejb.Remote;


@Remote
public interface AutovermietungSessionBeanRemote {
    void addAuto(Auto auto);
    void verleiheAuto(int i, Kunde kunde);
    void loescheAuto(int i);
    void addKunde(Kunde kunde);
    List getAutos();
    Auto getAuto(int i);
    List getKunden();
    Kunde getKunde(int i);
    void aendereAuto(int i, Auto auto);
}
