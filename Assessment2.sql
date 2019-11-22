-- Q.How can you retrieve all the information from the cd.facilities table?

SELECT *
FROM cd.facilities;

-- Q. You want to print out a list of all of the facilities and their cost to members. 
--How would you retrieve a list of only facility names and costs?

SELECT name, membercost
FROM cd.facilities;

-- Q. How can you produce a list of facilities that charge a fee to members?

SELECT name, membercost
FROM cd.facilities
WHERE membercost > 0;

-- Q. How can you produce a list of facilities that charge a fee to members, and that fee is less 
--than 1/50th of the monthly maintenance cost? 
--Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > (monthlymaintenance/50);

-- Q. How can you produce a list of all facilities with the word 'Tennis' in their name?

SELECT name
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- Q. How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

SELECT *
FROM cd.facilities
WHERE facid IN (1,5);

-- Q. How can you produce a list of members who joined after the start of September 2012? 
-- Return the memid, surname, firstname, and joindate of the members in question.

SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

-- Q. How can you produce an ordered list of the first 10 surnames in the members table? 
-- The list must not contain duplicates.

SELECT DISTINCT(surname)
FROM cd.members
WHERE surname != 'GUEST'
ORDER BY surname
LIMIT 10;

-- Q. You'd like to get the signup date of your last member. How can you retrieve this information?

SELECT MAX(joindate)
FROM cd.members;

-- Q. Produce a count of the number of facilities that have a cost to guests of 10 or more.

SELECT COUNT(name)
FROM cd.facilities
WHERE guestcost >=10;

-- Q. Produce a list of the total number of slots booked per facility in the month of September 2012. 
-- Produce an output table consisting of facility id and slots, sorted by the number of slots.

SELECT facid, SUM(slots) AS total
FROM cd.bookings
WHERE EXTRACT(month FROM starttime) = 9
AND EXTRACT(year FROM starttime)=2012
GROUP BY facid, slots
ORDER BY total DESC;

-- Q. How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
-- Return a list of start time and facility name pairings, ordered by the time.

SELECT facilities.name, bookings.starttime
FROM cd.facilities
JOIN cd.bookings
ON facilities.facid = bookings.facid
WHERE facilities.facid in (1,2)
AND (bookings.starttime > '2012-09-20' AND bookings.starttime < '2012-09-22')
ORDER BY bookings.starttime;

-- Q. How can you produce a list of the start times for bookings by members named 'David Farrell'?

SELECT bookings.starttime, members.firstname,members.surname
FROM cd.bookings
JOIN cd.members
ON bookings.memid = members.memid
WHERE members.firstname='David' AND members.surname = 'Farrell'


























