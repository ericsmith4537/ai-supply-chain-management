;; AI-Powered Supply Chain Management Platform
;; A comprehensive blockchain solution for modern supply chain operations
;; Built with transparency, sustainability, and AI-driven insights

;; ===========================================
;; CONSTANTS
;; ===========================================

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_NOT_FOUND (err u101))
(define-constant ERR_ALREADY_EXISTS (err u102))
(define-constant ERR_INVALID_INPUT (err u103))
(define-constant ERR_INSUFFICIENT_FUNDS (err u104))
(define-constant ERR_INVALID_STATUS (err u105))
(define-constant ERR_ACCESS_DENIED (err u106))
(define-constant ERR_EXPIRED (err u107))
(define-constant ERR_INVALID_STAGE (err u108))
(define-constant ERR_PAYMENT_FAILED (err u109))

;; Product lifecycle stages
(define-constant STAGE_DESIGN u1)
(define-constant STAGE_SOURCING u2)
(define-constant STAGE_MANUFACTURING u3)
(define-constant STAGE_TESTING u4)
(define-constant STAGE_PACKAGING u5)
(define-constant STAGE_SHIPPING u6)
(define-constant STAGE_DELIVERED u7)
(define-constant STAGE_COMPLETED u8)

;; Shipment statuses
(define-constant STATUS_PENDING u1)
(define-constant STATUS_IN_TRANSIT u2)
(define-constant STATUS_DELAYED u3)
(define-constant STATUS_DELIVERED u4)
(define-constant STATUS_CANCELLED u5)

;; Quality grades
(define-constant QUALITY_EXCELLENT u5)
(define-constant QUALITY_GOOD u4)
(define-constant QUALITY_AVERAGE u3)
(define-constant QUALITY_BELOW_AVERAGE u2)
(define-constant QUALITY_POOR u1)

;; ===========================================
;; DATA VARIABLES
;; ===========================================

(define-data-var platform-fee-percentage uint u250) ;; 2.5%
(define-data-var min-supplier-stake uint u1000000) ;; 1 STX
(define-data-var total-suppliers uint u0)
(define-data-var total-products uint u0)
(define-data-var total-shipments uint u0)
(define-data-var total-transactions uint u0)
(define-data-var total-assessments uint u0)
(define-data-var total-compliance-records uint u0)
(define-data-var total-analytics-reports uint u0)
(define-data-var total-sustainability-metrics uint u0)
(define-data-var platform-revenue uint u0)
(define-data-var last-analytics-update uint u0)

;; ===========================================
;; DATA MAPS
;; ===========================================

;; Supplier profiles and management
(define-map suppliers
  { supplier-id: uint }
  {
    owner: principal,
    name: (string-ascii 100),
    location: (string-ascii 100),
    industry: (string-ascii 50),
    certification-level: uint,
    risk-score: uint,
    sustainability-score: uint,
    total-products: uint,
    successful-deliveries: uint,
    avg-quality-rating: uint,
    stake-amount: uint,
    registration-date: uint,
    last-activity: uint,
    is-active: bool
  }
)

;; Product specifications and lifecycle
(define-map products
  { product-id: uint }
  {
    supplier-id: uint,
    name: (string-ascii 100),
    category: (string-ascii 50),
    description: (string-ascii 500),
    price: uint,
    current-stage: uint,
    quality-standard: uint,
    sustainability-rating: uint,
    carbon-footprint: uint,
    manufacturing-date: uint,
    expiry-date: (optional uint),
    certifications: (list 10 (string-ascii 50)),
    is-active: bool
  }
)

;; Shipment tracking and logistics
(define-map shipments
  { shipment-id: uint }
  {
    product-id: uint,
    supplier-id: uint,
    buyer: principal,
    origin: (string-ascii 100),
    destination: (string-ascii 100),
    current-location: (string-ascii 100),
    status: uint,
    estimated-delivery: uint,
    actual-delivery: (optional uint),
    transport-mode: (string-ascii 50),
    temperature-range: (optional { min: int, max: int }),
    special-instructions: (string-ascii 200),
    tracking-updates: (list 20 { timestamp: uint, location: (string-ascii 100), status: uint }),
    created-at: uint
  }
)

;; Quality assessments and compliance
(define-map quality-assessments
  { assessment-id: uint }
  {
    product-id: uint,
    shipment-id: uint,
    assessor: principal,
    overall-grade: uint,
    quality-metrics: { durability: uint, functionality: uint, appearance: uint, safety: uint },
    compliance-status: bool,
    defects-found: uint,
    corrective-actions: (string-ascii 300),
    assessment-date: uint,
    certification-valid-until: uint,
    notes: (string-ascii 500)
  }
)

;; Financial transactions and payments
(define-map financial-transactions
  { transaction-id: uint }
  {
    payer: principal,
    payee: principal,
    amount: uint,
    transaction-type: (string-ascii 50),
    related-shipment: (optional uint),
    related-product: (optional uint),
    escrow-released: bool,
    platform-fee: uint,
    payment-method: (string-ascii 50),
    transaction-date: uint,
    completion-date: (optional uint),
    status: (string-ascii 20),
    notes: (string-ascii 200)
  }
)

;; Compliance records and certifications
(define-map compliance-records
  { record-id: uint }
  {
    entity-id: uint,
    entity-type: (string-ascii 20), ;; "supplier" or "product"
    regulation-type: (string-ascii 100),
    compliance-status: bool,
    certification-body: (string-ascii 100),
    issue-date: uint,
    expiry-date: uint,
    certificate-hash: (string-ascii 64),
    audit-score: uint,
    non-compliance-issues: (list 10 (string-ascii 200)),
    corrective-measures: (string-ascii 500),
    last-reviewed: uint
  }
)

;; AI analytics and insights
(define-map analytics-reports
  { report-id: uint }
  {
    report-type: (string-ascii 50),
    generated-by: principal,
    data-period: { start: uint, end: uint },
    key-metrics: {
      total-volume: uint,
      avg-delivery-time: uint,
      success-rate: uint,
      cost-savings: uint
    },
    insights: (list 10 (string-ascii 300)),
    recommendations: (list 5 (string-ascii 300)),
    confidence-score: uint,
    generated-at: uint,
    expires-at: uint
  }
)

;; Sustainability and ESG metrics
(define-map sustainability-metrics
  { metric-id: uint }
  {
    entity-id: uint,
    entity-type: (string-ascii 20),
    carbon-footprint: uint,
    water-usage: uint,
    waste-generated: uint,
    renewable-energy-usage: uint,
    recycled-materials-percentage: uint,
    social-impact-score: uint,
    governance-score: uint,
    overall-esg-score: uint,
    measurement-period: { start: uint, end: uint },
    verification-status: bool,
    certifying-body: (optional (string-ascii 100)),
    last-updated: uint
  }
)

;; Authorized users and permissions
(define-map authorized-users
  { user: principal }
  { role: (string-ascii 20), permissions: (list 10 (string-ascii 50)), active: bool }
)

;; ===========================================
;; PUBLIC FUNCTIONS
;; ===========================================

;; Supplier registration and management
(define-public (register-supplier
    (name (string-ascii 100))
    (location (string-ascii 100))
    (industry (string-ascii 50))
    (stake-amount uint)
  )
  (let
    (
      (supplier-id (+ (var-get total-suppliers) u1))
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
    )
    (asserts! (>= stake-amount (var-get min-supplier-stake)) ERR_INSUFFICIENT_FUNDS)
    (asserts! (> (len name) u0) ERR_INVALID_INPUT)
    (asserts! (> (len location) u0) ERR_INVALID_INPUT)
    
    ;; Transfer stake to contract
    (try! (stx-transfer? stake-amount tx-sender (as-contract tx-sender)))
    
    ;; Create supplier record
    (map-set suppliers
      { supplier-id: supplier-id }
      {
        owner: tx-sender,
        name: name,
        location: location,
        industry: industry,
        certification-level: u1,
        risk-score: u50, ;; Default medium risk
        sustainability-score: u0,
        total-products: u0,
        successful-deliveries: u0,
        avg-quality-rating: u0,
        stake-amount: stake-amount,
        registration-date: current-time,
        last-activity: current-time,
        is-active: true
      }
    )
    
    (var-set total-suppliers supplier-id)
    (ok supplier-id)
  )
)

;; Product registration
(define-public (register-product
    (supplier-id uint)
    (name (string-ascii 100))
    (category (string-ascii 50))
    (description (string-ascii 500))
    (price uint)
    (quality-standard uint)
    (certifications (list 10 (string-ascii 50)))
  )
  (let
    (
      (product-id (+ (var-get total-products) u1))
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
      (supplier (unwrap! (map-get? suppliers { supplier-id: supplier-id }) ERR_NOT_FOUND))
    )
    (asserts! (is-eq tx-sender (get owner supplier)) ERR_UNAUTHORIZED)
    (asserts! (get is-active supplier) ERR_ACCESS_DENIED)
    (asserts! (> (len name) u0) ERR_INVALID_INPUT)
    (asserts! (> price u0) ERR_INVALID_INPUT)
    (asserts! (<= quality-standard QUALITY_EXCELLENT) ERR_INVALID_INPUT)
    
    ;; Create product record
    (map-set products
      { product-id: product-id }
      {
        supplier-id: supplier-id,
        name: name,
        category: category,
        description: description,
        price: price,
        current-stage: STAGE_DESIGN,
        quality-standard: quality-standard,
        sustainability-rating: u0,
        carbon-footprint: u0,
        manufacturing-date: current-time,
        expiry-date: none,
        certifications: certifications,
        is-active: true
      }
    )
    
    ;; Update supplier stats
    (map-set suppliers
      { supplier-id: supplier-id }
      (merge supplier { total-products: (+ (get total-products supplier) u1) })
    )
    
    (var-set total-products product-id)
    (ok product-id)
  )
)

;; Create shipment
(define-public (create-shipment
    (product-id uint)
    (buyer principal)
    (origin (string-ascii 100))
    (destination (string-ascii 100))
    (transport-mode (string-ascii 50))
    (estimated-delivery uint)
    (special-instructions (string-ascii 200))
  )
  (let
    (
      (shipment-id (+ (var-get total-shipments) u1))
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
      (product (unwrap! (map-get? products { product-id: product-id }) ERR_NOT_FOUND))
      (supplier (unwrap! (map-get? suppliers { supplier-id: (get supplier-id product) }) ERR_NOT_FOUND))
    )
    (asserts! (is-eq tx-sender (get owner supplier)) ERR_UNAUTHORIZED)
    (asserts! (get is-active product) ERR_ACCESS_DENIED)
    (asserts! (> estimated-delivery current-time) ERR_INVALID_INPUT)
    
    ;; Create shipment record
    (map-set shipments
      { shipment-id: shipment-id }
      {
        product-id: product-id,
        supplier-id: (get supplier-id product),
        buyer: buyer,
        origin: origin,
        destination: destination,
        current-location: origin,
        status: STATUS_PENDING,
        estimated-delivery: estimated-delivery,
        actual-delivery: none,
        transport-mode: transport-mode,
        temperature-range: none,
        special-instructions: special-instructions,
        tracking-updates: (list { timestamp: current-time, location: origin, status: STATUS_PENDING }),
        created-at: current-time
      }
    )
    
    ;; Update product stage to shipping
    (map-set products
      { product-id: product-id }
      (merge product { current-stage: STAGE_SHIPPING })
    )
    
    (var-set total-shipments shipment-id)
    (ok shipment-id)
  )
)

;; Update shipment status
(define-public (update-shipment-status
    (shipment-id uint)
    (new-status uint)
    (current-location (string-ascii 100))
  )
  (let
    (
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
      (shipment (unwrap! (map-get? shipments { shipment-id: shipment-id }) ERR_NOT_FOUND))
      (supplier (unwrap! (map-get? suppliers { supplier-id: (get supplier-id shipment) }) ERR_NOT_FOUND))
    )
    (asserts! (is-eq tx-sender (get owner supplier)) ERR_UNAUTHORIZED)
    (asserts! (<= new-status STATUS_CANCELLED) ERR_INVALID_STATUS)
    
    ;; Update shipment
    (map-set shipments
      { shipment-id: shipment-id }
      (merge shipment {
        status: new-status,
        current-location: current-location,
        actual-delivery: (if (is-eq new-status STATUS_DELIVERED) (some current-time) none),
        tracking-updates: (unwrap-panic (as-max-len?
          (append (get tracking-updates shipment)
            { timestamp: current-time, location: current-location, status: new-status })
          u20))
      })
    )
    
    ;; Update supplier stats if delivered
    (if (is-eq new-status STATUS_DELIVERED)
      (map-set suppliers
        { supplier-id: (get supplier-id shipment) }
        (merge supplier { successful-deliveries: (+ (get successful-deliveries supplier) u1) })
      )
      true
    )
    
    (ok true)
  )
)

;; Conduct quality assessment
(define-public (conduct-quality-assessment
    (product-id uint)
    (shipment-id uint)
    (overall-grade uint)
    (durability uint)
    (functionality uint)
    (appearance uint)
    (safety uint)
    (notes (string-ascii 500))
  )
  (let
    (
      (assessment-id (+ (var-get total-assessments) u1))
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
      (product (unwrap! (map-get? products { product-id: product-id }) ERR_NOT_FOUND))
    )
    (asserts! (<= overall-grade QUALITY_EXCELLENT) ERR_INVALID_INPUT)
    (asserts! (and (<= durability u100) (<= functionality u100) (<= appearance u100) (<= safety u100)) ERR_INVALID_INPUT)
    
    ;; Create assessment record
    (map-set quality-assessments
      { assessment-id: assessment-id }
      {
        product-id: product-id,
        shipment-id: shipment-id,
        assessor: tx-sender,
        overall-grade: overall-grade,
        quality-metrics: { durability: durability, functionality: functionality, appearance: appearance, safety: safety },
        compliance-status: (>= overall-grade (get quality-standard product)),
        defects-found: (if (< overall-grade u3) u1 u0),
        corrective-actions: "",
        assessment-date: current-time,
        certification-valid-until: (+ current-time u31536000), ;; 1 year
        notes: notes
      }
    )
    
    (var-set total-assessments assessment-id)
    (ok assessment-id)
  )
)

;; Process payment
(define-public (process-payment
    (shipment-id uint)
    (amount uint)
  )
  (let
    (
      (transaction-id (+ (var-get total-transactions) u1))
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
      (shipment (unwrap! (map-get? shipments { shipment-id: shipment-id }) ERR_NOT_FOUND))
      (supplier (unwrap! (map-get? suppliers { supplier-id: (get supplier-id shipment) }) ERR_NOT_FOUND))
      (platform-fee (/ (* amount (var-get platform-fee-percentage)) u10000))
      (supplier-amount (- amount platform-fee))
    )
    (asserts! (is-eq tx-sender (get buyer shipment)) ERR_UNAUTHORIZED)
    (asserts! (is-eq (get status shipment) STATUS_DELIVERED) ERR_INVALID_STATUS)
    (asserts! (> amount u0) ERR_INVALID_INPUT)
    
    ;; Transfer payment to supplier
    (try! (stx-transfer? supplier-amount tx-sender (get owner supplier)))
    
    ;; Transfer platform fee to contract
    (try! (stx-transfer? platform-fee tx-sender (as-contract tx-sender)))
    
    ;; Record transaction
    (map-set financial-transactions
      { transaction-id: transaction-id }
      {
        payer: tx-sender,
        payee: (get owner supplier),
        amount: amount,
        transaction-type: "payment",
        related-shipment: (some shipment-id),
        related-product: (some (get product-id shipment)),
        escrow-released: true,
        platform-fee: platform-fee,
        payment-method: "STX",
        transaction-date: current-time,
        completion-date: (some current-time),
        status: "completed",
        notes: "Shipment payment processed"
      }
    )
    
    ;; Update platform revenue
    (var-set platform-revenue (+ (var-get platform-revenue) platform-fee))
    (var-set total-transactions transaction-id)
    
    (ok transaction-id)
  )
)

;; Add compliance certification
(define-public (add-compliance-certification
    (entity-id uint)
    (entity-type (string-ascii 20))
    (regulation-type (string-ascii 100))
    (certification-body (string-ascii 100))
    (certificate-hash (string-ascii 64))
    (expiry-date uint)
    (audit-score uint)
  )
  (let
    (
      (record-id (+ (var-get total-compliance-records) u1))
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
    )
    (asserts! (> expiry-date current-time) ERR_INVALID_INPUT)
    (asserts! (<= audit-score u100) ERR_INVALID_INPUT)
    
    ;; Create compliance record
    (map-set compliance-records
      { record-id: record-id }
      {
        entity-id: entity-id,
        entity-type: entity-type,
        regulation-type: regulation-type,
        compliance-status: true,
        certification-body: certification-body,
        issue-date: current-time,
        expiry-date: expiry-date,
        certificate-hash: certificate-hash,
        audit-score: audit-score,
        non-compliance-issues: (list),
        corrective-measures: "",
        last-reviewed: current-time
      }
    )
    
    (var-set total-compliance-records record-id)
    (ok record-id)
  )
)

;; Generate AI analytics report
(define-public (generate-analytics-report
    (report-type (string-ascii 50))
    (start-period uint)
    (end-period uint)
  )
  (let
    (
      (report-id (+ (var-get total-analytics-reports) u1))
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
      (total-volume (var-get total-transactions))
      (avg-delivery-time u72) ;; Mock: 3 days in hours
      (success-rate u95) ;; Mock: 95% success rate
      (cost-savings u15000) ;; Mock savings
    )
    (asserts! (> end-period start-period) ERR_INVALID_INPUT)
    (asserts! (<= end-period current-time) ERR_INVALID_INPUT)
    
    ;; Create analytics report
    (map-set analytics-reports
      { report-id: report-id }
      {
        report-type: report-type,
        generated-by: tx-sender,
        data-period: { start: start-period, end: end-period },
        key-metrics: {
          total-volume: total-volume,
          avg-delivery-time: avg-delivery-time,
          success-rate: success-rate,
          cost-savings: cost-savings
        },
        insights: (list
          "Supply chain efficiency improved by 25%"
          "Delivery times reduced by 15%"
          "Quality standards maintained at 98%"
          "Sustainability scores increased by 20%"
          "Cost savings of $15,000 achieved"
        ),
        recommendations: (list
          "Optimize route planning for faster delivery"
          "Increase supplier quality assessments"
          "Implement predictive maintenance"
          "Expand sustainable sourcing options"
          "Enhance real-time tracking capabilities"
        ),
        confidence-score: u88,
        generated-at: current-time,
        expires-at: (+ current-time u2592000) ;; 30 days
      }
    )
    
    (var-set total-analytics-reports report-id)
    (var-set last-analytics-update current-time)
    (ok report-id)
  )
)

;; Update sustainability metrics
(define-public (update-sustainability-metrics
    (entity-id uint)
    (entity-type (string-ascii 20))
    (carbon-footprint uint)
    (water-usage uint)
    (waste-generated uint)
    (renewable-energy-usage uint)
    (recycled-materials-percentage uint)
    (social-impact-score uint)
    (governance-score uint)
  )
  (let
    (
      (metric-id (+ (var-get total-sustainability-metrics) u1))
      (current-time (unwrap-panic (get-block-info? time (- block-height u1))))
      (overall-esg-score (/ (+ social-impact-score governance-score (- u100 (/ carbon-footprint u1000))) u3))
    )
    (asserts! (<= recycled-materials-percentage u100) ERR_INVALID_INPUT)
    (asserts! (<= social-impact-score u100) ERR_INVALID_INPUT)
    (asserts! (<= governance-score u100) ERR_INVALID_INPUT)
    
    ;; Create or update sustainability metrics
    (map-set sustainability-metrics
      { metric-id: metric-id }
      {
        entity-id: entity-id,
        entity-type: entity-type,
        carbon-footprint: carbon-footprint,
        water-usage: water-usage,
        waste-generated: waste-generated,
        renewable-energy-usage: renewable-energy-usage,
        recycled-materials-percentage: recycled-materials-percentage,
        social-impact-score: social-impact-score,
        governance-score: governance-score,
        overall-esg-score: overall-esg-score,
        measurement-period: { start: (- current-time u2592000), end: current-time },
        verification-status: false,
        certifying-body: none,
        last-updated: current-time
      }
    )
    
    ;; Update supplier sustainability score if applicable
    (if (is-eq entity-type "supplier")
      (match (map-get? suppliers { supplier-id: entity-id })
        supplier (map-set suppliers
          { supplier-id: entity-id }
          (merge supplier { sustainability-score: overall-esg-score })
        )
        false
      )
      true
    )
    
    (var-set total-sustainability-metrics metric-id)
    (ok metric-id)
  )
)

;; ===========================================
;; READ-ONLY FUNCTIONS
;; ===========================================

;; Get supplier profile
(define-read-only (get-supplier-profile (supplier-id uint))
  (map-get? suppliers { supplier-id: supplier-id })
)

;; Get product details
(define-read-only (get-product-details (product-id uint))
  (map-get? products { product-id: product-id })
)

;; Get shipment information
(define-read-only (get-shipment-info (shipment-id uint))
  (map-get? shipments { shipment-id: shipment-id })
)

;; Get quality assessment
(define-read-only (get-quality-assessment (assessment-id uint))
  (map-get? quality-assessments { assessment-id: assessment-id })
)

;; Get financial transaction
(define-read-only (get-financial-transaction (transaction-id uint))
  (map-get? financial-transactions { transaction-id: transaction-id })
)

;; Get compliance record
(define-read-only (get-compliance-record (record-id uint))
  (map-get? compliance-records { record-id: record-id })
)

;; Get analytics report
(define-read-only (get-analytics-report (report-id uint))
  (map-get? analytics-reports { report-id: report-id })
)

;; Get sustainability metrics
(define-read-only (get-sustainability-metrics (metric-id uint))
  (map-get? sustainability-metrics { metric-id: metric-id })
)

;; Get platform statistics
(define-read-only (get-platform-stats)
  {
    total-suppliers: (var-get total-suppliers),
    total-products: (var-get total-products),
    total-shipments: (var-get total-shipments),
    total-transactions: (var-get total-transactions),
    platform-revenue: (var-get platform-revenue),
    platform-fee-percentage: (var-get platform-fee-percentage),
    min-supplier-stake: (var-get min-supplier-stake),
    last-analytics-update: (var-get last-analytics-update)
  }
)

;; Get supplier products
(define-read-only (get-supplier-products (supplier-id uint))
  (let
    (
      (supplier (map-get? suppliers { supplier-id: supplier-id }))
    )
    (match supplier
      s (some { 
        supplier-id: supplier-id, 
        total-products: (get total-products s),
        successful-deliveries: (get successful-deliveries s),
        avg-quality-rating: (get avg-quality-rating s)
      })
      none
    )
  )
)

;; Get active shipments for supplier
(define-read-only (get-active-shipments (supplier-id uint))
  (var-get total-shipments) ;; Simplified - would need iteration in full implementation
)

;; Get product shipment history
(define-read-only (get-product-shipment-history (product-id uint))
  (var-get total-shipments) ;; Simplified - would need iteration in full implementation
)

;; ===========================================
;; PRIVATE FUNCTIONS
;; ===========================================

;; Calculate supplier risk score
(define-private (calculate-supplier-risk-score
    (successful-deliveries uint)
    (product-count uint)
    (avg-quality-rating uint)
    (compliance-score uint)
  )
  (let
    (
      (delivery-rate (if (> product-count u0) (/ (* successful-deliveries u100) product-count) u0))
      (risk-score (- u100 (/ (+ delivery-rate avg-quality-rating compliance-score) u3)))
    )
    (if (> risk-score u100) u100 risk-score)
  )
)

;; Calculate AI performance metrics
(define-private (calculate-ai-metrics
    (prediction-accuracy uint)
    (cost-savings uint)
    (efficiency-improvement uint)
  )
  (let
    (
      (capped-savings (if (<= cost-savings u100) cost-savings u100))
      (capped-efficiency (if (<= efficiency-improvement u100) efficiency-improvement u100))
      (overall-score (/ (+ prediction-accuracy capped-savings capped-efficiency) u3))
    )
    { accuracy: prediction-accuracy, savings: cost-savings, efficiency: efficiency-improvement, overall: overall-score }
  )
)

;; Calculate ESG score
(define-private (calculate-esg-score
    (environmental-score uint)
    (social-score uint)
    (governance-score uint)
  )
  (/ (+ environmental-score social-score governance-score) u3)
)

;; Validate shipment status transition
(define-private (is-valid-status-transition (current-status uint) (new-status uint))
  (or
    ;; From pending
    (and (is-eq current-status STATUS_PENDING) 
         (or (is-eq new-status STATUS_IN_TRANSIT) (is-eq new-status STATUS_CANCELLED)))
    ;; From in transit
    (and (is-eq current-status STATUS_IN_TRANSIT)
         (or (is-eq new-status STATUS_DELIVERED) (is-eq new-status STATUS_DELAYED) (is-eq new-status STATUS_CANCELLED)))
    ;; From delayed
    (and (is-eq current-status STATUS_DELAYED)
         (or (is-eq new-status STATUS_DELIVERED) (is-eq new-status STATUS_IN_TRANSIT) (is-eq new-status STATUS_CANCELLED)))
  )
)

;; Check if user has permission
(define-private (has-permission (user principal) (permission (string-ascii 50)))
  (match (map-get? authorized-users { user: user })
    auth-user (is-some (index-of (get permissions auth-user) permission))
    false
  )
)
