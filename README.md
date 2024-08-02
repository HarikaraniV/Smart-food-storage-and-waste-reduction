# Smart Food Storage and Waste Reduction

This project aims to minimize food waste by optimizing storage conditions and tracking expiration dates. It includes a web application built with Java and Spring, using SQLyog Community for database management and Apache Tomcat as the web server.

## Table of Contents

- [Project Overview](#project-overview)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
- [Running the Project](#running-the-project)
- [Usage](#usage)
- [Contributing](#contributing)
  

## Project Overview

The "Smart Food Storage and Waste Reduction" project helps users keep track of their food inventory and reduce waste by providing reminders about expiration dates and suggesting optimal storage conditions.

## Installation

### Prerequisites

Before you begin, ensure you have the following software installed on your system:

- [Spring Tool Suite (STS)](https://spring.io/tools) 
- [SQLyog Community](https://www.webyog.com/product/sqlyog) (for database management)
- [Apache Tomcat](https://tomcat.apache.org/) (version 9.0 or above)
- [JDK 8 or higher](https://www.oracle.com/java/technologies/javase-jdk8-downloads.html)

### Setup

1. **Clone the Repository**
   ```sh
   git clone https://github.com/your-username/smart-food-storage-and-waste-reduction.git
   cd smart-food-storage-and-waste-reduction

**Import the Project into STS**

Open STS.
Go to File > Import....
Select Existing Maven Projects and click Next.
Browse to the cloned project directory and select it.
Click Finish to import the project.

**Set Up the Database**

Open SQLyog Community and create a new database.
Import the provided SQL script (if available) to set up the necessary tables and data.
Configure the database connection details in the project's application.properties or application.yml file.

**Configure Apache Tomcat**

Add Apache Tomcat to STS as a server:
Go to Window > Show View > Servers.
Right-click in the Servers view and select New > Server.
Choose Apache > Tomcat v9.0 Server and click Next.
Configure the Tomcat installation directory and click Finish.

**Running the Project**

Start Apache Tomcat

Right-click on the Tomcat server in the Servers view.
Select Start.
Deploy the Application

Right-click on the project in the Project Explorer.
Select Run As > Run on Server.
Choose the Apache Tomcat server and click Finish.
Access the Application

Open a web browser and navigate to http://localhost:8080/smart-food-storage-and-waste-reduction/index.html.

**Usage**
The web application allows users to manage their food inventory, track expiration dates, and receive notifications.
Users can log in, add food items, and view suggested storage conditions.
