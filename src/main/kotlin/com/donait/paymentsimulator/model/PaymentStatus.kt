package com.donait.paymentsimulator.model

enum class PaymentStatus(val description: String) {
    PENDING("결제 대기 중"),
    SUCCESS("결제 완료"),
    FAILED("결제 실패"),
    CANCELLED("결제 취소");

    companion object {
        fun fromString(status: String): PaymentStatus {
            return values().find { it.name == status.uppercase() }
                ?: throw IllegalArgumentException("Invalid payment status: $status")
        }
    }
} 