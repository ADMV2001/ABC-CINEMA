<%@ page import="java.util.List" %>
<%@ page import="DAO.MovieDAO" %>
<%@ page import="models.Movie" %>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@ page import="util.DBConnect" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Section</title>
    <style>
        body {
            margin: 0;
            font-family:'poppins', sans-serif;
        }

        h2 {
            text-align: center;
            color: white;
            margin: 20px 0;
        }

        .mv-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 10px;
            padding: 15px 50px 15px 50px;
            background-color: #222;
        }

        .card {
            flex: 1 1 calc(22% - 16px);
            box-sizing: border-box;
            border: 1px solid black;
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: calc(22% - 16px);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-6px);
        }

        .card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            display: block;
        }

        .card-content {
            padding: 12px;
            text-align: center;
            background-color:black;
        }

        .card-content h3 {
            margin: 8px 0;
            font-size: 1.2em;
            color: #333;
        }

        .card-content p {
            margin: 4px 0;
            font-size: 0.95em;
            color: #666;
        }

        .card-content .btn {
            display: inline-block;
            margin-top: 12px;
            padding: 8px 16px;
            font-size: 0.95em;
            color: #fff;
            background: red;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            cursor: pointer;
        }

        .card-content .btn:hover {
            background: white;
            color:black;
        }

        @media (max-width: 768px) {
            .mv-container{
                margin-top:0;
            }
            
            .card {
                flex: 1 1 calc(50% - 16px);
                max-width: calc(50% - 16px);
            }

            .card img {
                height: 250px;
            }

            .card-content {
                padding: 10px;
            }

            .card-content h3 {
                font-size: 1.1em;
            }

            .card-content p {
                font-size: 0.9em;
            }
        }

        @media (max-width: 480px) {
            .mv-container{
                margin-top:0;
            }
            
            .card {
                flex: 1 1 100%;
                max-width: 100%;
            }

            .card img {
                height: 200px;
            }

            .card-content {
                padding: 8px;
            }

            .card-content h3 {
                font-size: 1em;
            }

            .card-content p {
                font-size: 0.85em;
            }

            .card-content .btn {
                padding: 6px 12px;
                font-size: 0.85em;
            }
        }
    </style>
</head>
<body>
    <h2 style="color:white; text-align:left; margin-left:37px">Cinema Ongoing</h2>
    <div class="mv-container">
            <%
            MovieDAO dao = new MovieDAO();
            List<Movie> list = dao.getAllMovies();
            for(Movie movie : list){
            %>
            
            <div class="card">
                <img src="image?id=<%=movie.getMovieId()%>" alt="<%=movie.getMovieName()%>">
                <div class="card-content">
                    <h3 style='color:white'><%=movie.getMovieName()%></h3>
                    <p><%=movie.getGenre()%></p>
                    <p><%=movie.getDuration()%>m</p>
                    <a href="components/seatBooking.jsp?movie_id=<%=movie.getMovieId()%>" class="btn">Book Now</a>
                </div>
            </div>
            
            <%
            }
            %>
        
    </div>
</body>
</html>
