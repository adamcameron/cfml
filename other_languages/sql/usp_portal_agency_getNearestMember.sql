CREATE PROCEDURE [dbo].[usp_portal_agency_getNearestMember]
@GridEast int,
@GridNorth int,
@MemberType varchar = 'L',
@Nearestx int = 5

AS
set rowcount @Nearestx
SELECT  * 
from (
	SELECT  'Flight Centre Clapham' as CompanyName,
			'92 St. Johns Road' as Address1, 'Clapham' as Address2, '' as Address3, 'London' as Town, '' as County,  'SW11 1PX' as Postcode, 'United Kingdom' as Country,
			'02032021002' as Telephone1, 'http://flightcentreclapham.advantage4travel.com/' as Website, '1.3' as Miles
	UNION
	SELECT  'Downes & Bartlam Travel Agency' as CompanyName,
			'11-12 Piccadilly Arcade' as Address1, 'Hanley' as Address2, '' as Address3, 'Stoke On Trent' as Town, 'Staffordshire' as County, 'ST1 1DL' as Postcode, 'United Kingdom' as Country,
			'02032021002' as Telephone1, 'http://downesandbartlamtravelagency.advantage4travel.com/' as Website, '8' as Miles
	UNION
	SELECT  'Unmissable Ltd' as CompanyName,
			'Office 33a' as Address1, 'Ingate Place' as Address2, 'Battersea' as Address3, 'London' as Town, '' as County, 'SW8 3NS' as Postcode, 'United Kingdom' as Country,
			'02032021002' as Telephone1, 'http://unmissable.advantage4travel.com/' as Website, '1.3' as Miles
	UNION
	SELECT  'Spear Travels' as CompanyName,
			'Spear Travels' as Address1, 'Hanford' as Address2, '' as Address3, 'Stoke-On-Trent' as Town, 'Staffordshire' as County, 'ST4 4QY' as Postcode, 'United Kingdom' as Country,
			'02032021002' as Telephone1, 'http://speartravelstoke.advantage4travel.com/' as Website, '10' as Miles
	UNION
	SELECT  'WEXAS The Traveller''s Club' as CompanyName,
			'45-49 Brompton Road' as Address1, 'Knightsbridge' as Address2, '' as Address3, 'London' as Town, '' as County, 'SW3 1DE' as Postcode, 'United Kingdom' as Country,
			'02032021002' as Telephone1, 'http://wexas.advantage4travel.com/' as Website, '1.3' as Miles
) tmpTbl
GO
