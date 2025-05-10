package com.donait.paymentsimulator.model

import jakarta.persistence.*
import org.hibernate.annotations.CreationTimestamp
import java.time.LocalDateTime

@Entity
@Table(name = "transaction_logs")
data class TransactionLog(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "transaction_id", nullable = false)
    val transaction: Transaction,

    @Column(nullable = false)
    val userId: Long,

    @Column(nullable = false)
    val action: String,

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    val fromStatus: PaymentStatus?,

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    val toStatus: PaymentStatus?,

    @Column(length = 1000)
    val message: String? = null,

    @Column
    val additionalInfo: String? = null,

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    val createdAt: LocalDateTime = LocalDateTime.now()
) 