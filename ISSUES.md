# 작업 항목 목록

## 1주차: 프로젝트 기본 구성
### 1.1 프로젝트 설정
- [ ] Spring Boot + Kotlin 프로젝트 생성
- [ ] 기본 의존성 추가 (Spring Web, JPA, Security, JWT, H2)
- [ ] 애플리케이션 설정 파일 구성 (application.yml)
- [ ] 개발용 H2 데이터베이스 설정
- [ ] 기본 패키지 구조 설계 (controller, service, repository, model, dto, config)

### 1.2 데이터베이스 스키마 설계
- [ ] User 엔티티 설계 (ID, 이메일, 비밀번호, 이름, 가입일 등)
- [ ] Transaction 엔티티 설계 (ID, 사용자 ID, 상품 ID, 금액, 상태, 타임스탬프 등)
- [ ] 기본 데이터베이스 스키마 생성

### 1.3 보안 구성
- [ ] Spring Security 구성
- [ ] JWT 인증 구현
  - [ ] JwtTokenProvider 구현
  - [ ] JwtAuthenticationFilter 구현
  - [ ] SecurityConfig 설정
- [ ] 비밀번호 암호화 설정 (BCrypt)

## 2주차: 사용자 인증 및 결제 초기화 API
### 2.1 사용자 관리 기능
- [ ] User 엔티티 구현
- [ ] UserRepository 구현
- [ ] UserService 구현
- [ ] AuthController 구현
  - [ ] 회원가입 API (`/auth/signup`)
  - [ ] 로그인 API (`/auth/login`)
- [ ] DTO 클래스 구현
  - [ ] SignupRequestDto
  - [ ] LoginRequestDto
  - [ ] TokenResponseDto

### 2.2 결제 초기화 API
- [ ] Payment 상태 열거형 정의 (PENDING, SUCCESS, FAILED, CANCELLED)
- [ ] Transaction 엔티티 구현
- [ ] TransactionRepository 구현
- [ ] PaymentService 구현
  - [ ] 결제 초기화 로직
  - [ ] 가상 상품 및 금액 검증 로직
- [ ] PaymentController 구현
  - [ ] 결제 초기화 API (`/payment/init`)
- [ ] DTO 클래스 구현
  - [ ] PaymentInitRequestDto
  - [ ] PaymentResponseDto

### 2.3 기본 예외 처리
- [ ] 글로벌 예외 핸들러 구현
- [ ] 커스텀 예외 클래스 생성
  - [ ] InvalidRequestException
  - [ ] ResourceNotFoundException
  - [ ] AuthenticationException

## 3주차: 결제 확인 및 상태 조회 API
### 3.1 결제 확인 API
- [ ] PaymentService 확장
  - [ ] 결제 확인 로직 구현
  - [ ] 결제 성공/실패 시뮬레이션 로직
  - [ ] 트랜잭션 관리 (롤백 처리)
- [ ] PaymentController 확장
  - [ ] 결제 확인 API (`/payment/confirm/{transactionId}`)
- [ ] DTO 클래스 추가
  - [ ] PaymentConfirmRequestDto
  - [ ] PaymentConfirmResponseDto

### 3.2 결제 상태 조회 API
- [ ] PaymentService 확장
  - [ ] 트랜잭션 조회 로직 구현
- [ ] PaymentController 확장
  - [ ] 결제 상태 조회 API (`/payment/status/{transactionId}`)
- [ ] DTO 클래스 추가
  - [ ] TransactionStatusResponseDto

### 3.3 트랜잭션 로깅
- [ ] 트랜잭션 로그 엔티티 구현
- [ ] 로그 레포지토리 구현
- [ ] 로깅 서비스 구현
- [ ] AOP를 사용한 자동 로깅 구현

### 3.4 단위 테스트
- [ ] UserService 단위 테스트
- [ ] AuthController 단위 테스트
- [ ] PaymentService 단위 테스트
- [ ] PaymentController 단위 테스트

## 4주차: 테스트, 성능 최적화, 문서화
### 4.1 통합 테스트
- [ ] 인증 API 통합 테스트
- [ ] 결제 API 통합 테스트
- [ ] Postman 컬렉션 작성 및 테스트

### 4.2 성능 최적화
- [ ] 데이터베이스 인덱스 추가
- [ ] 쿼리 최적화
- [ ] 동시성 처리 개선

### 4.3 보안 강화
- [ ] 입력값 검증 로직 강화
- [ ] CORS 설정
- [ ] 보안 헤더 설정

### 4.4 API 문서화
- [ ] Swagger/OpenAPI 설정
- [ ] API 엔드포인트 문서화
- [ ] 요청/응답 예제 작성

### 4.5 프로젝트 문서화
- [ ] README.md 업데이트
- [ ] 설치 및 실행 가이드 작성
- [ ] API 사용 예제 추가

### 4.6 최종 테스트 및 점검
- [ ] 성능 테스트 (응답 시간, 동시 요청 처리)
- [ ] 보안 취약점 점검
- [ ] 코드 리뷰 및 리팩토링

## 추가 개선사항 (선택)
### A. 모니터링 시스템
- [ ] 결제 성공/실패율 모니터링
- [ ] API 응답 시간 모니터링
- [ ] 에러 로깅 및 알림 시스템

### B. 추가 기능
- [ ] 결제 취소 API 구현
- [ ] 사용자 잔액 관리 구현
- [ ] 간단한 상품 목록 API 구현

### C. MySQL 연동
- [ ] MySQL 데이터베이스 설정
- [ ] 프로덕션 환경 구성
- [ ] 데이터 마이그레이션 스크립트 작성 