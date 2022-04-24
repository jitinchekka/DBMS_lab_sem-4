-- Router1 and Router2 store details of LAN connections like MAC address, port, network ID VARCHAR.
-- WifiRouter stores details of WiFi connections like MAC address, port, access point name, password, Phone Number, and number of connections.
-- URLRequest stores details of website requests like MAC address, URL name, Router Name, and Access Count.
CREATE database LAN;
use lan;
CREATE Table Router1(MACaddress VARCHAR(17),port INT,network_ID VARCHAR(20));
CREATE Table Router2(MACaddress VARCHAR(17),port INT,network_ID VARCHAR(20));
CREATE TABLE WifiRouter(MACaddress VARCHAR(17),port INT, access_point_name VARCHAR(25), password VARCHAR(20),phoneNumber VARCHAR(10), no_of_connections INT);
CREATE Table URLRequest(MACaddress VARCHAR(17), URL_name VARCHAR(50),Router_name VARCHAR(25),AccessCount INT);

-- 1. Display list of MAC address who are accessing particular website like “iiitdm.ac.in”
SELECT MACaddress FROM urlrequest 