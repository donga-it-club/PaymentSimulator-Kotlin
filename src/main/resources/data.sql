-- 샘플 상품 데이터
INSERT INTO products (product_code, name, price, description, stock, available, created_at, updated_at)
VALUES
    ('PROD001', '스마트폰', 1000000.00, '최신형 스마트폰', 100, true, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('PROD002', '노트북', 1500000.00, '고성능 노트북', 50, true, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('PROD003', '무선이어폰', 300000.00, '노이즈 캔슬링 이어폰', 200, true, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('PROD004', '스마트워치', 500000.00, '건강 모니터링 기능', 150, true, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('PROD005', '태블릿', 800000.00, '고해상도 디스플레이', 80, true, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- 관리자 계정 (비밀번호: admin1234)
-- 실제 운영 환경에서는 비밀번호를 해시하여 저장해야 합니다
INSERT INTO users (email, password, name, created_at, updated_at)
VALUES ('admin@example.com', '$2a$10$qx7Gp1ogNNPj5lmfvFD.vuNmNdmQIEOl0ZXx5xN3zhBYK9zCUbOti', '관리자', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- 샘플 사용자 계정 (비밀번호: user1234)
INSERT INTO users (email, password, name, created_at, updated_at)
VALUES ('user@example.com', '$2a$10$fK3.x1q12c4.M/4MO9n8GeyHZO9yT8.X0pOstVkVj0g4/OL4sZVPS', '테스트 사용자', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()); 