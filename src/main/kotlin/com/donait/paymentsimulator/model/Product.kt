package com.donait.paymentsimulator.model

import jakarta.persistence.*
import org.hibernate.annotations.CreationTimestamp
import org.hibernate.annotations.UpdateTimestamp
import java.math.BigDecimal
import java.time.LocalDateTime

@Entity
@Table(name = "products")
data class Product(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    @Column(nullable = false, unique = true)
    val productCode: String,

    @Column(nullable = false)
    val name: String,

    @Column(nullable = false)
    val price: BigDecimal,

    @Column
    val description: String? = null,

    @Column(nullable = false)
    var stock: Int = 0,

    @Column(nullable = false)
    var available: Boolean = true,

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    val createdAt: LocalDateTime = LocalDateTime.now(),

    @UpdateTimestamp
    @Column(nullable = false)
    var updatedAt: LocalDateTime = LocalDateTime.now()
) {
    fun decreaseStock(quantity: Int) {
        if (quantity <= 0) {
            throw IllegalArgumentException("Quantity must be greater than 0")
        }
        if (stock < quantity) {
            throw IllegalStateException("Not enough stock available")
        }
        stock -= quantity
        updatedAt = LocalDateTime.now()
    }

    fun increaseStock(quantity: Int) {
        if (quantity <= 0) {
            throw IllegalArgumentException("Quantity must be greater than 0")
        }
        stock += quantity
        updatedAt = LocalDateTime.now()
    }
} 