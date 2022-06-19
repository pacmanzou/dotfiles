package main

import (
	"fmt"
	"math/rand"
	"time"
)

const simulationNumber = 1000000 // 模拟发牌次数
const cardsNumber = 4            // 先手4张牌

var countExpand float64
var countBreak float64
var chExpand = make(chan float64)
var chBreak = make(chan float64)
var deckNoAwakening = []string{
	"使魔",
	"使魔",
	"眷属",
	"眷属",
	"公爵",
	"格蕾丝",
	"红灾星",
	"红男爵",
	"妖女",
	"领域",
	"帝国",
	"帝国",
	"欲望",
	"欲望",
	"欲望",
	"转换",
	"牛头鬼",
	"牛头鬼",
	"牛头鬼",
	"堕落武者",
	"堕落武者",
	"堕落武者",
	"控制器",
	"控制器",
}
var deckIdeal = []string{
	"使魔",
	"使魔",
	"眷属",
	"眷属",
	"巫师",
	"公爵",
	"格蕾丝",
	"红灾星",
	"红男爵",
	"妖女",
	"领域",
	"帝国",
	"帝国",
	"欲望",
	"欲望",
	"欲望",
	"转换",
	"觉醒",
	"觉醒",
	"觉醒",
	"牛头鬼",
	"牛头鬼",
	"牛头鬼",
	"堕落武者",
	"堕落武者",
	"堕落武者",
	"控制器",
	"控制器",
	"月之书",
	"月之书",
}

type Deck struct {
	Type  string
	Value []string
}

func main() {
	start := time.Now()
	rand.Seed(time.Now().Unix())

	deck := Deck{"noAwakening", deckNoAwakening}
	// deck := Deck{"ideal", deckIdeal}

	go dealExpand(deck)
	go dealBreak(deck)

	fmt.Println("吸血鬼卡组(先手): " + deck.Type)
	fmt.Printf("展开概率: %.2f%%\n", <-chExpand/simulationNumber*100)
	fmt.Printf("伪二速炸卡场概率: %.2f%%\n", <-chBreak/simulationNumber*100)
	fmt.Printf("高星魔法概率: %.2f%%\n", lock(deck.Value))

	elapsed := time.Since(start)
	fmt.Printf("\nelapsed: %v\n", elapsed)
}

func lock(deck []string) float64 {
	var countLock float64
	var res float64 = 1
	var deckLock = []string{
		"使魔",
		"眷属",
		"巫师",
		"觉醒",
		"牛头鬼",
		"堕落武者",
		"控制器",
		"月之书",
	}

	for _, v := range deck {
		if !IsExist(deckLock, v) {
			countLock++
		}
	}

	a := countLock
	b := float64(len(deck))

	for i := 0.0; i < cardsNumber; i++ {
		res = (a - i) / (b - i) * res
	}
	return res * 100
}

func dealExpand(deck Deck) {
	for i := 0; i < simulationNumber; i++ {
		cards := randomCards(deck.Value)

		if IsExist(cards, "觉醒") {
			countExpand++
		} else if IsExistOr(cards, "牛头鬼", "堕落武者") &&
			IsExistOr(
				cards,
				"使魔",
				"眷属",
				"巫师",
				"公爵",
				"格蕾丝",
				"红男爵",
				"红灾星",
				"妖女",
				"转换",
			) {
			countExpand++
		} else if IsExistOr(cards, "眷属", "使魔", "巫师") && IsExist(cards, "欲望") {
			countExpand++
		} else if IsExistAnd(cards, "眷属", "领域") &&
			IsExistOr(
				cards,
				"公爵",
				"格蕾丝",
				"红男爵",
				"红灾星",
			) {
			countExpand++
		}
	}
	chExpand <- countExpand
}

func dealBreak(deck Deck) {
	if deck.Type == "noAwakening" {
		for i := 0; i < simulationNumber; i++ {
			cards := randomCards(deck.Value)

			if IsExistAnd(cards, "眷属", "欲望") {
				countBreak++
			} else if IsExistAnd(cards, "眷属", "领域", "公爵") {
				countBreak++
			} else if IsExistAnd(cards, "使魔", "欲望", "公爵") {
				countBreak++
			} else if IsExistOr(cards, "牛头鬼", "堕落武者") &&
				IsExist(cards, "公爵") {
				countBreak++
			} else if IsExistOr(cards, "牛头鬼", "堕落武者") &&
				IsExist(cards, "欲望") &&
				IsExistOr(
					cards,
					"眷属",
					"使魔",
					"公爵",
					"格蕾丝",
					"红男爵",
					"红灾星",
					"妖女",
					"转换",
					"帝国",
					"欲望",
					"领域",
				) {
				countBreak++
			}
		}
	} else {
		for i := 0; i < simulationNumber; i++ {
			cards := randomCards(deck.Value)

			if IsExistAnd(cards, "觉醒", "帝国") {
				countBreak++
			} else if IsExistAnd(cards, "眷属", "欲望") {
				countBreak++
			} else if IsExistAnd(cards, "眷属", "领域", "公爵") {
				countBreak++
			} else if IsExistAnd(cards, "使魔", "欲望") &&
				IsExistOr(cards, "觉醒", "帝国", "转换", "公爵") {
				countBreak++
			} else if IsExistOr(cards, "牛头鬼", "堕落武者") &&
				IsExist(cards, "公爵") {
				countBreak++
			} else if IsExistOr(cards, "牛头鬼", "堕落武者") &&
				IsExistOr(cards, "欲望", "觉醒", "帝国", "转换") &&
				IsExistOr(
					cards,
					"使魔",
					"眷属",
					"巫师",
					"公爵",
					"格蕾丝",
					"红男爵",
					"红灾星",
					"妖女",
					"转换",
					"帝国",
					"欲望",
					"领域",
					"觉醒",
				) {
				countBreak++
			}
		}
	}
	chBreak <- countBreak
}

func randomCards(deck []string) []string {
	// 每次都使用deck的副本
	newDeck := make([]string, len(deck))
	copy(newDeck, deck)

	cards := make([]string, cardsNumber)

	for i := 0; i < cardsNumber; i++ {
		index := rand.Intn(len(newDeck))
		cards[i] = newDeck[index]
		newDeck = append(newDeck[:index], newDeck[index+1:]...)
	}
	return cards
}

func IsExistOr(cards []string, card ...string) bool {
	for _, v := range cards {
		if IsExist(card, v) {
			return true
		}
	}
	return false
}

func IsExistAnd(cards []string, card ...string) bool {
	for _, v := range card {
		if !IsExist(cards, v) {
			return false
		}
	}
	return true
}

func IsExist(cards []string, card string) bool {
	for _, v := range cards {
		if card == v {
			return true
		}
	}
	return false
}
