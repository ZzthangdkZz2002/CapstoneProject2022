package com.example.electriccomponentsshop.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.math.BigInteger;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name="ImportItem")
public class ImportItem {
        @EmbeddedId
        private ImportItemId importItemId;
        private BigInteger quantity;
        private BigDecimal importPrice;
        @OneToOne(cascade = CascadeType.ALL)
        @JoinColumn(name = "sku_id", referencedColumnName = "id")
        private Sku sku;
        @ManyToOne(fetch = FetchType.EAGER)
        @MapsId("importTransactionId")
        @JoinColumn(name = "import_transaction_id")
        private ImportTransaction importTransaction;
        @ManyToOne(fetch = FetchType.EAGER)
        @MapsId("containerId")
        @JoinColumn(name = "container_id")
        private Container container;
        @ManyToOne(fetch = FetchType.EAGER)
        @MapsId("productId")
        @JoinColumn(name = "product_id")
        private Product productImport;
        private BigDecimal subTotal;


}