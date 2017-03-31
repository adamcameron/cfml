<cfquery>
CREATE TABLE colours (
  id int,
  en varchar(45),
  mi varchar(45),
  PRIMARY KEY (id)
)
</cfquery>

<cfquery>
INSERT INTO colours VALUES
(1,'red','whero'),
(2,'orange','karaka'),
(3,'yellow','kowhai'),
(4,'green','kakariki'),
(5,'blue','kikorangi'),
(6,'indigo','poropango'),
(7,'purple','papura')
</cfquery>

<cfquery name="colours">
SELECT *
FROM colours
</cfquery>

<cfdump var="#colours#">

