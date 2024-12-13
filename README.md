# Music Store Data Analysis Project

## Overview 🎵🎶✨

This project demonstrates SQL-based data analysis on a pre-existing music store database. The database contains comprehensive details about customers, invoices, tracks, genres, employees, and more. This project answers various analytical questions about customer spending, popular genres, artist contributions, etc.

This project aims to showcase my SQL expertise in extracting meaningful insights from complex datasets. By leveraging SQL queries and analytical techniques, I provide actionable insights that would be valuable for business decisions concerning the dataset. 🎯📊📈

---

## Objectives 🎯🚀📌

1. **Understand Customer Behavior**

   - 🎵 Identify the best customers and the cities generating the highest revenue.
   - 🎶 Analyze customer preferences for music genres.

2. **Track Popularity and Artist Contribution**

   - 🎸 Find top-performing tracks and artists.
   - 🎤 Analyze genre popularity across different countries.

3. **Performance Insights**

   - 📊 Determine employee hierarchy based on job titles.
   - 🎼 Identify long-duration tracks and compare them to the average track length.

---

## Dataset Description 🗂️📋📂

The database schema includes the following tables:

- 🎨 **Artist**: Contains details about artists.
- 💿 **Album**: Maps albums to their respective artists.
- 🎵 **Track**: Tracks belong to albums, along with metadata such as genre and length.
- 🎶 **Genre**: Lists genres for tracks.
- 🛒 **InvoiceLine**: Details about purchases.
- 🧾 **Invoice**: Contains invoice details, including customer and billing information.
- 👤 **Customer**: Contains customer demographic information.
- 🏢 **Employee**: Information about employees, including hierarchy and titles.

Refer to the [database schema](./Music_Store_Database_Schema.png) for further details. 🖼️🗺️🛠️

---

## Key Analysis Questions ❓🔍📜

This project addresses the following analytical questions:

1. 🎤 **Who is the senior-most employee based on job title?**
2. 🌍 **Which countries have the most invoices?**
3. 🏆 **What are the top 3 invoice totals?**
4. 🌆 **Which city has the best customers in terms of total revenue?**
5. 🛍️ **Who is the best customer based on total spending?**
6. 🎶 **List the email, first name, and genre of all Rock music listeners, ordered alphabetically by email.**
7. 🎸 **Identify the top 10 artists contributing to Rock music tracks.**
8. 🎵 **Find tracks that exceed the average song length.**
9. 💰 **Calculate the total amount spent by each customer on specific artists.**
10. 📈 **Determine the most popular music genre for each country.**
11. 🛒 **Find the top-spending customers for each country, including ties.**

---

## Tools and Techniques Used 🛠️📊🖥️

- 🛠️ **SQL Queries**: Complex joins, aggregate functions, common table expressions (CTEs), recursive queries, window functions (ROW\_NUMBER, PARTITION BY).
- 📊 **Data Analysis**: Insights derived using grouping, filtering, and sorting.
- 🖥️ **GitHub**: For version control and showcasing the project.

---

## Key Highlights ✨📈🌟

1. **Recursive Queries**:

   - 🔁 Used to determine the most popular genres across different countries.

2. **Window Functions**:

   - 🪟 Implemented `ROW_NUMBER` to handle ranking scenarios, such as determining top customers or artists.

3. **Optimized Joins**:

   - 🚀 Employed efficient joins (`INNER JOIN`, `USING`, `WHERE`) to extract relevant data from normalized tables.

---

## Results 📊🏆🔑

The SQL scripts provided answer all the questions listed in the "Key Analysis Questions" section. Each query is designed to be efficient and produces actionable insights for the music store business.

---

## How to Use This Project 🖥️🔧📥

1. Clone the repository:

```bash
https://github.com/ajinkyabh2203/music-store-data-analysis-project.git
```

2. Load the database schema and data into your preferred SQL database management system (e.g., MySQL, PostgreSQL).

3. Execute the SQL queries provided in the [SQL script file](./music_store_database_sql_analysis.sql).

4. Review the insights generated and adapt queries for further analysis if needed.

---

## Contact 📧📱💼

Feel free to reach out if you have questions about the project or want to collaborate on future data analysis projects:

- **Email**: [ajinkyabh2203@gmail.com](mailto\:ajinkyabh2203@gmail.com)
- **LinkedIn**: [linkedin.com/in/ajinkyabh2203](https://linkedin.com/in/ajinkyabh2203)
- **GitHub**: [github.com/ajinkyabh2203](https://github.com/ajinkyabh2203)

---

## License 📝⚖️🔓

This project is open-source and available under the [MIT License](./LICENSE).


