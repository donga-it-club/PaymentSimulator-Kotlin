# PaymentSimulator-Kotlin
2025 바이브코딩 워크숍 

## 개요
이 프로젝트는 취업을 위해서 만든 학습용 프로젝트 입니다.
목표로 하는 포지션(Job Description)은 다음과 같습니다.
https://about.daangn.com/jobs/4511184003/

기획은 Grok3를 사용하였고, Cursor를 이용한 바이브 코팅으로 구현하였습니다.


## 프로젝트 상세

### 간단한 결제 시스템 시뮬레이터 (Kotlin + Spring Boot)

**목표**: Kotlin과 Spring Boot를 활용해 결제 시스템의 기본 흐름을 이해하고, REST API 설계 및 구현 능력을 키운다.  
**프로젝트 개요**:  
- 가상 쇼핑몰의 결제 시스템을 시뮬레이션하는 백엔드 애플리케이션 개발.  
- 사용자 인증, 결제 요청, 결제 상태 관리, 트랜잭션 로그 저장 기능을 구현.  
- 예: 사용자가 상품을 선택하고 결제를 요청하면, 결제 상태(성공/실패)를 DB에 기록하고 결과를 반환.  
**구체적인 구현 단계**:  
1. **환경 설정**: Kotlin, Spring Boot, H2 또는 MySQL로 개발 환경 구성.  
2. **API 설계**: `/payment/init`, `/payment/confirm`, `/payment/status` 등의 REST API 엔드포인트 구현.  
3. **핵심 기능**:  
   - 사용자 인증(JWT 또는 Spring Security 기본 구현).  
   - 결제 트랜잭션 처리(예: 가상 결제 금액 검증, 상태 업데이트).  
   - 에러 핸들링(결제 실패 시 롤백, 예외 처리).  
4. **DB 연동**: JPA를 사용해 결제 데이터와 사용자 정보를 저장.  
5. **테스트**: Postman 또는 JUnit으로 API 기능 테스트.  
**배울 점**:  
- Kotlin의 문법과 Spring Boot의 MVC 구조 이해.  
- RESTful API 설계 원칙과 HTTP 상태 코드 활용.  
- 트랜잭션 관리와 기본적인 동시성 처리 개념.  
**JD 관련성**: 결제 시스템 개발 경험과 Kotlin/Spring Boot 스킬을 직접적으로 연습하며, JD에서 요구하는 “결제 도메인 이해”와 “API 개발” 역량을 키움.  
