package com.donait.paymentsimulator.model

import jakarta.persistence.*
import org.hibernate.annotations.CreationTimestamp
import org.hibernate.annotations.UpdateTimestamp
import java.math.BigDecimal
import java.time.LocalDateTime

@Entity
@Table(name = "transactions")
data class Transaction(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    val user: User,

    @Column(nullable = false)
    val amount: BigDecimal,

    @Column(nullable = false)
    val productId: String,

    @Column(nullable = false)
    val quantity: Int,

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    var status: PaymentStatus = PaymentStatus.PENDING,

    @Column
    var completedAt: LocalDateTime? = null,

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    val createdAt: LocalDateTime = LocalDateTime.now(),

    @UpdateTimestamp
    @Column(nullable = false)
    var updatedAt: LocalDateTime = LocalDateTime.now()
) {
    // 상태 변경 메소드
    fun markAsSuccess() {
        this.status = PaymentStatus.SUCCESS
        this.completedAt = LocalDateTime.now()
        this.updatedAt = LocalDateTime.now()
    }

    fun markAsFailed() {
        this.status = PaymentStatus.FAILED
        this.updatedAt = LocalDateTime.now()
    }

    fun markAsCancelled() {
        this.status = PaymentStatus.CANCELLED
        this.updatedAt = LocalDateTime.now()
    }
} 