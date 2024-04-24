package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Customer;

public class CustomerDAO extends DAO {

    public Customer search(String login, String password) throws Exception {
        Customer customer = null;

        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(
                     "SELECT * FROM customer WHERE login=? AND password=?")) {
            st.setString(1, login);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setLogin(rs.getString("login"));
                customer.setPassword(rs.getString("password"));
            }
        }

        return customer;
    }
}
