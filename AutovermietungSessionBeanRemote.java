
package com.autovermietung;

import java.util.List;
import javax.ejb.Remote;
import javax.jws.WebService;

@WebService
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
}
