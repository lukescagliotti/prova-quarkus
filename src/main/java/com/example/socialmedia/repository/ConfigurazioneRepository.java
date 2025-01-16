package com.example.socialmedia.repository;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@ApplicationScoped
public class ConfigurazioneRepository {

    @PersistenceContext
    EntityManager em;

    public Map<String, String> getConfigurationsByGroupId(Integer groupId) {
        List<Object[]> results = em.createQuery(
                "SELECT c.descrizione, c.valore FROM Configurazione c WHERE c.gruppo = :groupId", Object[].class)
                .setParameter("groupId", groupId)
                .getResultList();
    
        return results.stream()
                      .collect(Collectors.toMap(
                          row -> (String) row[0], // descrizione
                          row -> (String) row[1]  // valore
                      ));
    }

    public Integer findIdByValore(String valore) {
        return em.createQuery("SELECT c.id FROM Configurazione c WHERE c.valore = :valore", Integer.class)
                .setParameter("valore", valore)
                .getResultStream()
                .findFirst()
                .orElse(null);
    }
}