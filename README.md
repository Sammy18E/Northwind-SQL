# Northwind SQL Projekt  
**Modul: Datenbanken & SQL**  

---

## 1. Projektbeschreibung  
Dieses Projekt entstand im Rahmen des Moduls *Datenbanken & SQL*. Ziel war es, die fiktive Firmendatenbank **Northwind Traders** neu aufzusetzen, zu modellieren, mit Daten zu befüllen und anschließend anhand komplexer SQL-Abfragen zu analysieren.

Der Fokus lag auf:  
- Datenbankmodellierung  
- Schlüsseldefinition (Primary/Foreign Keys)  
- SQL-Abfragen für Analysezwecke  
- Datenvisualisierung (ergänzend im Jupyter Notebook)  
- Teamarbeit und Präsentation

---

## 2. Aufgabenstellung (gekürzt)  
Nach dem Import der Northwind-Daten in eine neue PostgreSQL-Datenbank sollten verschiedene Analysefragen beantwortet werden, u. a.:

1. Welche Produkte wurden verkauft?  
2. Welche Produkte waren zuletzt auf Lager?  
3. Was sind die drei teuersten / drei günstigsten Produkte?  
4. Welche Produkte kosten über 21$?  
5. Welche Produkte kosten zwischen 5$ und 15$?  
6. Welche Produkte kosten weniger als der Durchschnitt?  
7. Wie viele Produkte wurden eingestellt?  
8. Welcher Kunde hat am meisten gekauft?  
9. In welchem Alter wurden Mitarbeiter eingestellt?  
10. Welche Bestellzahlen überstiegen den Vorrat?  
11. Welcher Verkäufer machte die meisten Geschäfte?  
12. Welcher Kunde bestellte die größte Menge eines Produkts?  
13. Veränderungen zwischen 1996, 1997 und 1998.

---

## 3. Vorgehen / Umsetzung  

### **1. Setup**
- Löschen einer alten Northwind-Datenbank  
- Klonen des „clean“ Northwind-Datensatzes  
  (Quelle: https://github.com/pawlodkowski/northwind_data_clean)  
- Anlegen einer neuen PostgreSQL-Datenbank  
- Import und Modellierung in **DBeaver**

### **2. Modellierung**
- Strukturierung aller Tabellen  
- Setzen sämtlicher **Primary Keys** und **Foreign Keys**  
- Überprüfung der relationalen Konsistenz

### **3. Analyse**
- Erstellung umfangreicher SQL-Abfragen  
- Untersuchung von Produkten, Lagerbeständen, Verkäufern, Kunden & Trends  
- Teamunterstützung bei verschiedenen Fragen  
- Aufbereitung der Ergebnisse in einer Präsentation

---

## 4. Dateien im Repository  

| Datei | Beschreibung |
|-------|--------------|
| **Tabellen.sql** | DBeaver-Projektdateien inkl. Tabellenstruktur & Keys |
| **daten.ipynb** | Analyse-Notebook mit geografischen Visualisierungen |
| **Präsentation.pptx** | Abschlusspräsentation des Projekts |

---

## 5. Inhalte der Dateien  

### **daten.ipynb** – Notebook zur geografischen Analyse  
Dieses Notebook ergänzt die SQL-Auswertung um **geografische Visualisierungen**:

- Einbindung von Bestellmengen pro Land  
- Laden eines Weltkarten-Shapefiles via **GeoPandas**  
- Zusammenführung der Kartendaten mit den Bestelldaten  
- Darstellung der Bestellmengen durch proportional große Kreise  
- Beschriftung der Mengen direkt auf der Karte  

Ziel:  
Eine globale, visuelle Übersicht über Bestellschwerpunkte der Northwind Traders.

---

## 6. Mein Beitrag  
Meine Aufgaben im Projekt:

- Wahl und Einrichtung der Datenbank (**PostgreSQL**)  
- Löschen der alten Northwind-Datenbank  
- Import des „clean“-Datensatzes  
- Modellierung & Verknüpfung aller Tabellen über Keys  
- Unterstützung meiner Teamkollegen bei der Erstellung von Analyseabfragen  
- Beitrag zur Abschlusspräsentation

---

## 7. Technologien & Tools  
- **PostgreSQL**  
- **DBeaver**  
- **SQL**  
- **Python**  
- **Pandas / GeoPandas**  
- **Matplotlib**  

---

## Zusammenfassung

Das Projekt zeigt die vollständige Umsetzung eines relationalen Datenbanksystems in PostgreSQL – von der Modellierung über das Setzen der Beziehungen bis hin zu analytischen SQL-Abfragen.
Die Northwind-Datenbank bietet ein realistisches Szenario, um praktische Erfahrungen in Datenbanken, SQL-Abfragen und relationalem Denken zu sammeln.
