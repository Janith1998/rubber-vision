<div class="disease-library">
    <div class="library-header">
        <h2>Disease Library</h2>
        <p>Comprehensive information about rubber tree diseases</p>
    </div>

    <div class="search-container">
        <div class="search-box">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Search diseases..." id="disease-search">
        </div>
    </div>

    <div class="section-title">
        <h3>Common Rubber Tree Diseases</h3>
    </div>

    <div class="disease-grid">
        <!-- Disease Card 1 -->
        <div class="disease-card" data-disease="corynespora">
            <div class="card-header" style="background-color: rgba(239, 68, 68, 0.1);">
                <div class="disease-icon" style="color: #ef4444;">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <div class="severity-badge" style="background-color: #ef4444;">High</div>
            </div>
            <div class="card-body">
                <h4>Corynespora Leaf Fall</h4>
                <p class="scientific-name">Corynespora cassiicola</p>
                <p class="description">A serious fungal disease causing circular to irregular leaf spots with concentric rings...</p>
            </div>
            <div class="card-footer">
                <button class="view-details">View Details</button>
            </div>
        </div>

        <!-- Disease Card 2 -->
        <div class="disease-card" data-disease="birds-eye">
            <div class="card-header" style="background-color: rgba(249, 115, 22, 0.1);">
                <div class="disease-icon" style="color: #f97316;">
                    <i class="fas fa-eye"></i>
                </div>
                <div class="severity-badge" style="background-color: #f97316;">Moderate</div>
            </div>
            <div class="card-body">
                <h4>Bird's Eye Spot</h4>
                <p class="scientific-name">Helminthosporium heveae</p>
                <p class="description">Characterized by small circular spots resembling bird eyes, affecting leaf photosynthetic efficiency...</p>
            </div>
            <div class="card-footer">
                <button class="view-details">View Details</button>
            </div>
        </div>

        <!-- Disease Card 3 -->
        <div class="disease-card" data-disease="powdery-mildew">
            <div class="card-header" style="background-color: rgba(59, 130, 246, 0.1);">
                <div class="disease-icon" style="color: #3b82f6;">
                    <i class="fas fa-cloud"></i>
                </div>
                <div class="severity-badge" style="background-color: #3b82f6;">Moderate</div>
            </div>
            <div class="card-body">
                <h4>Powdery Mildew</h4>
                <p class="scientific-name">Oidium heveae</p>
                <p class="description">White powdery fungal growth on leaf surfaces, more prevalent in dry weather with high humidity...</p>
            </div>
            <div class="card-footer">
                <button class="view-details">View Details</button>
            </div>
        </div>

        <!-- Disease Card 4 -->
        <div class="disease-card" data-disease="phytophthora">
            <div class="card-header" style="background-color: rgba(168, 85, 247, 0.1);">
                <div class="disease-icon" style="color: #a855f7;">
                    <i class="fas fa-tint"></i>
                </div>
                <div class="severity-badge" style="background-color: #a855f7;">High</div>
            </div>
            <div class="card-body">
                <h4>Phytophthora Leaf Fall</h4>
                <p class="scientific-name">Phytophthora spp.</p>
                <p class="description">Water mold causing rapid leaf fall during wet conditions, can lead to significant yield loss...</p>
            </div>
            <div class="card-footer">
                <button class="view-details">View Details</button>
            </div>
        </div>

        <!-- Disease Card 5 -->
        <div class="disease-card" data-disease="colletotrichum">
            <div class="card-header" style="background-color: rgba(34, 197, 94, 0.1);">
                <div class="disease-icon" style="color: #22c55e;">
                    <i class="fas fa-leaf"></i>
                </div>
                <div class="severity-badge" style="background-color: #22c55e;">Moderate</div>
            </div>
            <div class="card-body">
                <h4>Colletotrichum Leaf Spot</h4>
                <p class="scientific-name">Colletotrichum gloeosporioides</p>
                <p class="description">Fungal disease causing anthracnose symptoms, particularly problematic in rainy seasons...</p>
            </div>
            <div class="card-footer">
                <button class="view-details">View Details</button>
            </div>
        </div>
    </div>
</div>

<!-- Disease Details Modal -->
<div class="disease-modal" id="disease-modal">
    <div class="modal-content">
        <div class="modal-header">
            <div class="header-left">
                <div class="modal-icon" id="modal-icon">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <div>
                    <h3 id="modal-disease-name">Corynespora Leaf Fall</h3>
                    <p id="modal-scientific-name">Corynespora cassiicola</p>
                </div>
            </div>
            <div class="severity-badge" id="modal-severity">High</div>
            <button class="close-modal">&times;</button>
        </div>
        
        <div class="modal-body">
            <div class="description-section">
                <p id="modal-description">A serious fungal disease causing circular to irregular leaf spots with concentric rings, leading to premature defoliation.</p>
            </div>
            
            <div class="symptoms-section">
                <h4><i class="fas fa-exclamation-circle"></i> Symptoms</h4>
                <ul id="symptoms-list">
                    <li>Large irregular brown spots (1-5 cm diameter)</li>
                    <li>Yellow halos around lesions</li>
                    <li>Premature leaf fall</li>
                    <li>Black fungal spores visible under microscope</li>
                </ul>
            </div>
            
            <div class="management-section">
                <h4><i class="fas fa-tasks"></i> Management</h4>
                <ul id="management-list">
                    <li>Fungicides containing mancozeb or chlorothalonil</li>
                    <li>Remove and destroy infected leaves</li>
                    <li>Improve air circulation in plantations</li>
                    <li>Avoid overhead irrigation</li>
                </ul>
            </div>
        </div>
        
        <div class="modal-footer">
            <button class="btn-close">Close</button>
        </div>
    </div>
</div>

<style>
    /* Disease Library Styles */
    .disease-library {
        padding: 24px;
        background-color: #f9fafb;
    }

    .library-header {
        margin-bottom: 24px;
    }

    .library-header h2 {
        font-size: 24px;
        font-weight: 700;
        color: #111827;
        margin-bottom: 4px;
    }

    .library-header p {
        font-size: 14px;
        color: #6b7280;
    }

    .search-container {
        margin-bottom: 24px;
    }

    .search-box {
        position: relative;
        max-width: 500px;
    }

    .search-box i {
        position: absolute;
        left: 16px;
        top: 50%;
        transform: translateY(-50%);
        color: #9ca3af;
    }

    .search-box input {
        width: 100%;
        padding: 12px 16px 12px 44px;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        font-size: 14px;
        background-color: white;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
    }

    .search-box input:focus {
        outline: none;
        border-color: #6366f1;
        box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
    }

    .section-title {
        margin-bottom: 16px;
    }

    .section-title h3 {
        font-size: 18px;
        font-weight: 600;
        color: #111827;
    }

    .disease-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 20px;
    }

    .disease-card {
        background-color: white;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .disease-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px;
    }

    .disease-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
    }

    .severity-badge {
        padding: 4px 10px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        color: white;
    }

    .card-body {
        padding: 0 16px 16px;
    }

    .card-body h4 {
        font-size: 16px;
        font-weight: 600;
        color: #111827;
        margin-bottom: 4px;
    }

    .scientific-name {
        font-size: 13px;
        color: #6b7280;
        font-style: italic;
        margin-bottom: 12px;
    }

    .description {
        font-size: 14px;
        color: #4b5563;
        line-height: 1.5;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .card-footer {
        padding: 12px 16px;
        border-top: 1px solid #f3f4f6;
    }

    .view-details {
        width: 100%;
        padding: 8px 16px;
        background-color: transparent;
        border: 1px solid #e5e7eb;
        border-radius: 6px;
        color: #4b5563;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.2s;
    }

    .view-details:hover {
        background-color: #f9fafb;
        border-color: #d1d5db;
    }

    /* Modal Styles */
    .disease-modal {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1000;
        opacity: 0;
        visibility: hidden;
        transition: opacity 0.3s, visibility 0.3s;
    }

    .disease-modal.active {
        opacity: 1;
        visibility: visible;
    }

    .modal-content {
        background-color: white;
        border-radius: 12px;
        width: 90%;
        max-width: 700px;
        max-height: 90vh;
        overflow-y: auto;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        padding: 20px;
        border-bottom: 1px solid #f3f4f6;
    }

    .header-left {
        display: flex;
        align-items: center;
        gap: 16px;
    }

    .modal-icon {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
    }

    .modal-header h3 {
        font-size: 20px;
        font-weight: 600;
        color: #111827;
        margin-bottom: 4px;
    }

    .modal-header p {
        font-size: 14px;
        color: #6b7280;
        font-style: italic;
    }

    .close-modal {
        background: none;
        border: none;
        font-size: 24px;
        color: #9ca3af;
        cursor: pointer;
        padding: 4px;
        margin-left: 16px;
    }

    .close-modal:hover {
        color: #6b7280;
    }

    .modal-body {
        padding: 20px;
    }

    .description-section {
        margin-bottom: 24px;
    }

    .description-section p {
        font-size: 15px;
        line-height: 1.6;
        color: #4b5563;
    }

    .symptoms-section, .management-section {
        margin-bottom: 24px;
    }

    .symptoms-section h4, .management-section h4 {
        font-size: 16px;
        font-weight: 600;
        color: #111827;
        margin-bottom: 12px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .symptoms-section ul, .management-section ul {
        list-style-type: none;
        padding-left: 0;
    }

    .symptoms-section li, .management-section li {
        position: relative;
        padding-left: 24px;
        margin-bottom: 8px;
        font-size: 15px;
        color: #4b5563;
    }

    .symptoms-section li::before, .management-section li::before {
        content: "•";
        position: absolute;
        left: 8px;
        color: #9ca3af;
    }

    .modal-footer {
        padding: 16px 20px;
        border-top: 1px solid #f3f4f6;
        display: flex;
        justify-content: flex-end;
    }

    .btn-close {
        padding: 8px 20px;
        background-color: #6366f1;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    .btn-close:hover {
        background-color: #4f46e5;
    }

    @media (max-width: 768px) {
        .disease-grid {
            grid-template-columns: 1fr;
        }
        
        .modal-content {
            width: 95%;
        }
    }
</style>

<script>
    // Disease data (could be fetched from API in a real application)
    const diseases = {
        corynespora: {
            name: 'Corynespora Leaf Fall',
            scientificName: 'Corynespora cassiicola',
            severity: 'High',
            color: '#ef4444',
            icon: 'fa-exclamation-triangle',
            description: 'A serious fungal disease causing circular to irregular leaf spots with concentric rings, leading to premature defoliation.',
            symptoms: [
                'Large irregular brown spots (1-5 cm diameter)',
                'Yellow halos around lesions',
                'Premature leaf fall',
                'Black fungal spores visible under microscope'
            ],
            management: [
                'Fungicides containing mancozeb or chlorothalonil',
                'Remove and destroy infected leaves',
                'Improve air circulation in plantations',
                'Avoid overhead irrigation'
            ],
            image: './images/1.png'
        },
        'birds-eye': {
            name: 'Bird\'s Eye Spot',
            scientificName: 'Helminthosporium heveae',
            severity: 'Moderate',
            color: '#f97316',
            icon: 'fa-eye',
            description: 'Characterized by small circular spots resembling bird eyes, affecting leaf photosynthetic efficiency.',
            symptoms: [
                'Small circular spots (2-5mm)',
                'Dark brown margins with gray centers',
                'Spots may coalesce in severe cases',
                'Most common in young leaves'
            ],
            management: [
                'Copper-based fungicides',
                'Proper spacing between trees',
                'Balanced fertilization',
                'Regular monitoring'
            ],
            image: './images/1.png'
        },
        'powdery-mildew': {
            name: 'Powdery Mildew',
            scientificName: 'Oidium heveae',
            severity: 'Moderate',
            color: '#3b82f6',
            icon: 'fa-cloud',
            description: 'White powdery fungal growth on leaf surfaces, more prevalent in dry weather with high humidity.',
            symptoms: [
                'White powdery patches on leaves',
                'Leaf curling and distortion',
                'Reduced latex yield',
                'Young leaves more susceptible'
            ],
            management: [
                'Sulfur-based fungicides',
                'Avoid dense planting',
                'Remove severely infected leaves',
                'Maintain proper tree nutrition'
            ],
            image: './images/1.png'
        },
        phytophthora: {
            name: 'Phytophthora Leaf Fall',
            scientificName: 'Phytophthora spp.',
            severity: 'High',
            color: '#a855f7',
            icon: 'fa-tint',
            description: 'Water mold causing rapid leaf fall during wet conditions, can lead to significant yield loss.',
            symptoms: [
                'Dark, water-soaked lesions',
                'Rapid leaf shedding during rains',
                'Blackened leaf veins',
                'Twig dieback in severe cases'
            ],
            management: [
                'Phosphorous acid fungicides',
                'Improve drainage in plantations',
                'Remove infected plant material',
                'Avoid wounding trees'
            ],
            image: './images/1.png'
        },
        colletotrichum: {
            name: 'Colletotrichum Leaf Spot',
            scientificName: 'Colletotrichum gloeosporioides',
            severity: 'Moderate',
            color: '#22c55e',
            icon: 'fa-leaf',
            description: 'Fungal disease causing anthracnose symptoms, particularly problematic in rainy seasons.',
            symptoms: [
                'Irregular brown leaf spots',
                'Yellow halos around lesions',
                'Black fruiting bodies in centers',
                'Twig dieback in severe infections'
            ],
            management: [
                'Fungicides containing azoxystrobin',
                'Prune affected branches',
                'Avoid overhead irrigation',
                'Maintain proper tree spacing'
            ],
            image: './images/1.png'
        }
    };

    // DOM elements
    const diseaseModal = document.getElementById('disease-modal');
    const modalDiseaseName = document.getElementById('modal-disease-name');
    const modalScientificName = document.getElementById('modal-scientific-name');
    const modalSeverity = document.getElementById('modal-severity');
    const modalIcon = document.getElementById('modal-icon');
    const modalDescription = document.getElementById('modal-description');
    const symptomsList = document.getElementById('symptoms-list');
    const managementList = document.getElementById('management-list');
    const closeModalBtn = document.querySelector('.close-modal');
    const btnClose = document.querySelector('.btn-close');

    // Open modal when clicking on a disease card
    document.querySelectorAll('.view-details').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const diseaseCard = this.closest('.disease-card');
            const diseaseId = diseaseCard.getAttribute('data-disease');
            const disease = diseases[diseaseId];

            if (!disease) return; // Add this check
            
            // Populate modal with disease data
            modalDiseaseName.textContent = disease.name;
            modalScientificName.textContent = disease.scientificName;
            modalSeverity.textContent = disease.severity;
            modalSeverity.style.backgroundColor = disease.color;
            modalIcon.innerHTML = `<i class="fas ${disease.icon}"></i>`;
            modalIcon.style.color = disease.color;
            modalDescription.textContent = disease.description;
            
            // Populate symptoms list
            symptomsList.innerHTML = '';
            disease.symptoms.forEach(symptom => {
                const li = document.createElement('li');
                li.textContent = symptom;
                symptomsList.appendChild(li);
            });
            
            // Populate management list
            managementList.innerHTML = '';
            disease.management.forEach(item => {
                const li = document.createElement('li');
                li.textContent = item;
                managementList.appendChild(li);
            });
            
            // Show modal
            diseaseModal.classList.add('active');
            document.body.style.overflow = 'hidden'; // Prevent scrolling behind modal
        });
    });

    // Close modal
    function closeModal() {
        diseaseModal.classList.remove('active');
        document.body.style.overflow = 'auto'; // Re-enable scrolling
    }

    closeModalBtn.addEventListener('click', closeModal);
    btnClose.addEventListener('click', closeModal);

    // Close modal when clicking outside
    diseaseModal.addEventListener('click', function(e) {
        if (e.target === diseaseModal) {
            closeModal();
        }
    });

    // Close modal with Escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && diseaseModal.classList.contains('active')) {
            closeModal();
        }
    });

    // Search functionality
    const searchInput = document.getElementById('disease-search');
    searchInput.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        document.querySelectorAll('.disease-card').forEach(card => {
            const diseaseId = card.getAttribute('data-disease');
            const disease = diseases[diseaseId];
            const matches = disease.name.toLowerCase().includes(searchTerm) || 
                          disease.scientificName.toLowerCase().includes(searchTerm) ||
                          disease.description.toLowerCase().includes(searchTerm);
            
            card.style.display = matches ? 'block' : 'none';
        });
    });
</script>




