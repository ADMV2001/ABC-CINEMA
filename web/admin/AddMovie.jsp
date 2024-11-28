<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddMovie.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css">
    <title>Add New Movie</title>
</head>
<body>
    <%@ include file="admin_nav.jsp" %>
    
    <div class="body-div">
        <div class="container">
        <a href="#" class="back-link">Admin Dashboard</a>
            <form class="add-movie-form" action="movieServlet" method="post" enctype="multipart/form-data">
                <h2>Add New Movie</h2>

                <input id="movie-name" name="movieName" type="text" placeholder="Movie Name" required>
                <input id="genre" name="genre" type="text" placeholder="Genre" required>
                <div class="time-duration">
                    <input id="hours" name="durationHours" type="text" placeholder="Duration (Hours)" required>
                    <input id="minutes" name="durationMinutes" type="text" placeholder="Duration (Minutes)" required>
                </div>

                <label class="label">Select Dates</label>
                <div id="date-picker-container">
                    <div class="date-picker">
                        <input type="date" name="available_dates" placeholder="Add Dates" required>
                        <a href="#" class="add-date-button" onclick="addDatePicker()">Add Dates</a>
                    </div>
                </div>

                <label class="label">Show Times</label>
                <div class="checkbox-container">
                    <div class="checkbox-item">
                        <input type="checkbox" id="show1" name="show_times" value="10:30 AM">
                        <label for="show1">10:30 AM</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="show2" name="show_times" value="1:30 PM">
                        <label for="show2">1:30 PM</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="show3" name="show_times" value="4:30 PM">
                        <label for="show3">4:30 PM</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="show4" name="show_times" value="9:00 PM">
                        <label for="show4">9:00 PM</label>
                    </div>
                </div> <br>

                <label class="label" for="upload-image">Movie Poster</label>
                <input id="upload-image" name="posterImage" type="file" accept="image/*" required>

                <button type="submit" value="addMovie">Add Movie</button>
            </form>
        </div>

    </div>
    
    <script>
        function addDatePicker() {
            const container = document.getElementById('date-picker-container');
            const newDatePicker = document.createElement('div');
            newDatePicker.innerHTML = `
                <input type="date" name="available_dates" required>
                <a class="remove-date-button" onclick="removeDatePicker(this)">Remove</a>
            `;
            container.appendChild(newDatePicker);
        }
    
        function removeDatePicker(button) {
            button.parentElement.remove();
        }
    </script>
    
</body>
</html>