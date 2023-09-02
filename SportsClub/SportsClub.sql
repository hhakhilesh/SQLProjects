/*Produce a list of facilities that charge a fee to members, 
and that fee is less than 1/50th of the monthly maintenance cost.*/

SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 AND
(membercost < monthlymaintenance/50.0);

/*Produce a list of the total number of slots booked per facility in the month of September 2012. 
Produce an output table consisting of facility id and slots, sorted by the number of slots.*/

SELECT facid, sum(slots) AS "Total Slots" 
FROM cd.bookings 
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01' 
GROUP BY facid 
ORDER BY SUM(slots);

/* Produce a list of the start times for bookings for tennis courts, 
for the date '2012-09-21'. Return a list of start time and facility name pairings, ordered by the time.
*/

SELECT cd.bookings.starttime AS start, cd.facilities.name 
AS name 
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0,1) 
AND cd.bookings.starttime >= '2012-09-21' 
AND cd.bookings.starttime < '2012-09-22' 
ORDER BY cd.bookings.starttime;

/*Produce a list of the start times for bookings by members named 'David Farrell'?*/

SELECT cd.bookings.starttime 
FROM cd.bookings 
INNER JOIN cd.members ON 
cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname='David' 
AND cd.members.surname='Farrell';
