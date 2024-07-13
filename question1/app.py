
#mysql://jd:jeyadev@172.19.240.109:3306/development
import streamlit as st
import mysql.connector
import pandas as pd

# Function to create a connection to the MySQL database
def create_connection(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=db_name
        )
        st.success("Connection to MySQL DB successful")
    except mysql.connector.Error as err:
        st.error(f"Error: '{err}'")
    return connection

# Function to execute a query and fetch data
def run_query(connection, query):
    st.write(sql_query)
    st.write(query)
    cursor = connection.cursor(dictionary=True)
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
    except:
        st.error(f'Failed to run the query - {query}')
    return result

# Streamlit interface
st.title('MySQL Database Connector')

# Database connection parameters
st.sidebar.header('Database Connection Parameters')
host = st.sidebar.text_input('Host', 'localhost')
user = st.sidebar.text_input('User', 'root')
password = st.sidebar.text_input('Password', type='password')
database = st.sidebar.text_input('Database')



st.header('Query the Database')
sql_query = st.text_input('SQL Query ', 'SELECT * FROM "Enter your table name";')

if st.button('Run Query'):
    try:
        connection = create_connection(host, user, password, database)
        data = run_query(connection, query=sql_query)   
        
        if data:
            df = pd.DataFrame(data)
            st.table(df)
        else:
            st.write("No data found or query failed.")
    except:
        st.error('Not Able make connect to database due to invalid crendentials')
  
    
    # if st.button('Run Query'):
    #     try:    
    #         data = run_query(connection, query)
    #         if data:
    #             df = pd.DataFrame(data)
    #             st.write(df)
    #         else:
    #             st.write("No data found or query failed.")
    #     except:
    #         st.warning('Query Execution Failed')
