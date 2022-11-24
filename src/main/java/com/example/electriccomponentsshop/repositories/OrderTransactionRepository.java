package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.dto.StatisticDTO;
import com.example.electriccomponentsshop.entities.Account;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.services.StatisticService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface OrderTransactionRepository extends JpaRepository<OrderTransaction, Integer> {
Optional<OrderTransaction> findById(Integer id);
Optional<OrderTransaction> findByOrderid(String orderid);
List<OrderTransaction> findAllByAccountuser(Account accountuser);
List<OrderTransaction> findAllByAccountuserAndStatus(Account accountuser, String status);
List<OrderTransaction> findAllByStatus(String status);

@Query(value = "SELECT * FROM order_transaction where user_phone = :phone", nativeQuery = true)
List<OrderTransaction> findAllByUserphone(String phone);

@Query(value = "Select date_format(created, \"%d-%m-%Y\") as 'date', Sum(amount) as 'revenue', Sum(profit) as 'profit', created\n" +
        "From e2c.order_transaction e2c\n" +
        "where is_paid = 1 and status = 'Hoàn Thành'\n" +
        "Group by date_format(created, \"%M %d %Y\")\n" +
        "having date_format(current_date(), \"%M %d %Y\") = date_format(created, \"%M %d %Y\");", nativeQuery = true)
StatisticDTO statsByCurrentDay();

@Query(value = "Select Date_format(created, \"%Y-%m\") as 'date', sum(amount) as 'revenue', sum(profit) as 'profit'\n" +
        "From e2c.order_transaction\n" +
        "where date_format(created, \"%Y\") = :year and is_paid = 1 and status = 'Hoàn Thành'   \n" +
        "GROUP BY date\n" +
        "order by date;" , nativeQuery = true)
List<StatisticDTO> statsMonthByYear(String year);

    @Query(value = "Select Year(created) as 'date', Sum(amount) as 'revenue', Sum(profit) as 'profit'\n" +
            "From e2c.order_transaction e2c\n" +
            "where is_paid = 1 and status = 'Hoàn Thành'\n" +
            "Group by Year(created);" , nativeQuery = true)
    List<StatisticDTO> statsByYear();
}
