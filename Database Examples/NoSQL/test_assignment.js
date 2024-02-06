/*
	Student Name:   Simon Johnson
	Student  ID:     000608675
	Date written: 19/04/2023
*/ 

/*********************************************************************************/

/*
-- Task no: 1
-- Task details: Use insertOne() statement to insert the following data into the movies collection.
*/
db.movies.insertOne({
    movieID: 1,
    movieName: "Eyes Wide Shut",
    releaseYear: 1999,
    boxOffice: 162.1,
    directorID: 1,
    country: "USA",
    starrings:
    [
        {
            sFName: "Tom",
            sLName: "Cruise"
        },
        {
            sFName: "Nicole",
            sLName: "Kidman"
        },
        {
            sFName: "Sydney",
            sLName: "Pollack"
        },
    ],
    producers:[
        {
            pFName: "Stanley",
            pLName: "Kubric"
        }
    ]
})


/*********************************************************************************/

/*
-- Task no: 2 a
-- Task details: Use insertMany() statement to insert the following data into the movies collection.
*/
db.movies.insertMany([
    {
        movieID: 2,
        movieName: "Michael Clayton",
        releaseYear: 2007,
        boxOffice: 93.0,
        directorID: 2,
        country: "",
        starrings:
        [
            {
                sFName: "George",
                sLName: "Clooney"
            },
            {
                sFName: "Sydney",
                sLName: "Pollack"
            }
        ],
        producers:[
            {
                pFName: "Sydney",
                pLName: "Pollack"
            },
            {
                pFName: "Jennifer",
                pLName: "Fox"
            }
        ]
    },
    {
        movieID: 3,
        movieName: "Far and Away",
        releaseYear: 1992,
        boxOffice: "",
        directorID: 3,
        country: "USA",
        starrings:
        [
            {
                sFName: "Tom",
                sLName: "Cruise"
            },
            {
                sFName: "Nicole",
                sLName: "Kidman"
            },
            {
                sFName: "Thomas",
                sLName: "Gibson"
            },
        ],
        producers:[
            {
                pFName: "Brian",
                pLName: "Frazer"
            },
            {
                pFName: "Ron",
                pLName: "Howard"
            }
        ]
    }
])

/*********************************************************************************/

/*
-- Task no: 2 b
-- Task details: Use the directors collection, use insertMary() statement to insert the following data into the directors collection:
*/
db.directors.insertMany([
    {
        directorID: 1,
        dFName: "Stanley",
        dLName: "Kubric"
    },
    {
        directorID: 2,
        dFName: "Tony",
        dLName: "Gillroy"
    },
    {
        directorID: 3,
        dFName: "Ron",
        dLName: "Howard"
    },
    {
        directorID: 4,
        dFName: "Tarik",
        dLName: "Saleh"
    },
    {
        directorID: 5,
        dFName: "Elizabeth",
        dLName: "Allen"
    },
    {
        directorID: 6,
        dFName: "Alex",
        dLName: "Kurtzman"
    }
])

/*********************************************************************************/

/*
-- Task no: 3
-- Task details: Use findOne() statement to retrieve the movie information for the movie name as “Eyes Wide Shut”. Do not show the starring sub-document in the output.
*/
db.movies.findOne({movieName: "Eyes Wide Shut"}, {starrings: 0})


/*********************************************************************************/

/*
-- Task no: 4
-- Task details: Use find() statement to retrieve the movie information for all movies release year earlier than year 2000. Display the documents in a easy-to-read format.
*/
db.movies.find({releaseYear:{$lt: 2000}}).pretty()

/*********************************************************************************/

/*
-- Task no: 5
-- Task details: Use an update query statement to modify the movie document for the movieID = 2 and change the boxOffice from 93.0 instead of 95.5.
*/
db.movies.updateOne(
    {movieID: 2},
    {$set: {boxOffice: 95.5}}
    )

db.movies.findOne({movieID: 2})

/*********************************************************************************/

/*
-- Task no: 6
-- Task details: Use an insertOne() statement to insert a new movie name with two extra data fields as shown in the following:
*/
db.movies.insertOne({
    movieID: 4,
    movieName: "The Mummy",
    releaseYear: 2017,
    boxOffice: 410.0,
    budget: 190.0,
    language: "English",
    directorID: 6,
    country: "USA",
    starrings:
    [
        {
            sFName: "Tom",
            sLName: "Cruise"
        },
        {
            sFName: "Annabelle",
            sLName: "Wallis"
        }
    ],
    producers:
    [
        {
            dFName: "Alex",
            dLName: "Kurtzman"
        }
    ]
})

db.movies.findOne({movieName: "The Mummy"})

/*********************************************************************************/

/*
-- Task no: 7
-- Task details: Use a query statement to delete the specific document in the directors collection where the director name is Tarik Saleh.
*/
db.directors.deleteOne(
    {$and: [{dFName: "Tarik"},{dLName:"Saleh"}]}
)

db.directors.find().pretty()
/*********************************************************************************/

/*
-- Task no: 8
-- Task details: Use deleteMany() statement to delete multiple documents in the directors collection where the directors id are either 5 or 6.
*/
db.directors.deleteMany(
    {$or: [{directorID: 5}, {directorID: 6}]}
)

db.directors.find().pretty()
/*********************************************************************************/

/*
-- Task no: 9
-- Task details: Use a query to show the movie information together with the director name for each movie document. No need to show the starrings sub-document, the producers sub-document, nor the director id.
*/
db.movies.aggregate(
    [
        {
            $lookup:
            {
                from: "directors",
                localField: "directorID",
                foreignField: "directorID",
                as: "movies_directors"
            }
        },
        {$project: {directorID: 0, starrings: 0, producers: 0, movies_directors:{directorID:0}}}
    ]
).pretty()
