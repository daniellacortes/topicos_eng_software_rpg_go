package entity

import (
	"math/rand"
	"time"

	"github.com/google/uuid"
)

type Battle struct {
	ID           string `json:"id"`
	PlayerID     string `json:"player_id"`
	EnemyID      string `json:"enemy_id"`
	PlayerName   string `json:"player_name"`
	EnemyName    string `json:"enemy_name"`
	Action       string `json:"action"`
	DiceThrown   int    `json:"dice_thrown"`
	Result       string `json:"result"`
	PlayerHealth int    `json:"player_health"`
	EnemyHealth  int    `json:"enemy_health"`
}

func NewBattle(playerID, enemyID, playerName, enemyName, action string, playerHealth, enemyHealth int) *Battle {
	rand.Seed(time.Now().UnixNano())
	dice := rand.Intn(6) + 1
	result := ""

	// Determina o resultado da ação com base na ação escolhida (atacar ou curar)
	if action == "attack" {
		if dice >= 4 { // Sucesso no ataque
			result = "Player dealt damage to the enemy!"
			enemyHealth -= dice * 2
		} else { // Ataque falhou
			result = "Player missed the attack!"
		}
	} else if action == "heal" {
		if dice >= 4 { // Sucesso na cura
			result = "Player healed successfully!"
			playerHealth += dice * 2
			if playerHealth > 100 {
				playerHealth = 100
			}
		} else { // Cura falhou
			result = "Player failed to heal!"
		}
	}

	// Garante que a vida do inimigo não seja negativa
	if enemyHealth < 0 {
		enemyHealth = 0
	}

	return &Battle{
		ID:           uuid.New().String(),
		PlayerID:     playerID,
		EnemyID:      enemyID,
		PlayerName:   playerName,
		EnemyName:    enemyName,
		Action:       action,
		DiceThrown:   dice,
		Result:       result,
		PlayerHealth: playerHealth,
		EnemyHealth:  enemyHealth,
	}
}