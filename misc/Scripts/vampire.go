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

func main() {
	start := time.Now()
	rand.Seed(time.Now().Unix())

	go dealExpand()
	go dealBreak()

	fmt.Println("吸血鬼卡组(先手): ")
	fmt.Printf("展开概率: %.2f%%\n", <-chExpand/simulationNumber*100)
	fmt.Printf("伪二速炸卡场概率: %.2f%%\n", <-chBreak/simulationNumber*100)

	elapsed := time.Since(start)
	fmt.Printf("\nelapsed: %v\n", elapsed)
}

func dealExpand() {
	for i := 0; i < simulationNumber; i++ {
		cards := randomCards()

		if IsExistAnd(cards, "觉醒", "帝国") {
			countExpand++
		} else if IsExistOr(cards, "牛头鬼", "堕落") &&
			IsExistOr(
				cards,
				"使魔",
				"眷属",
				"巫师",
				"影之吸血鬼",
				"公爵",
				"格蕾丝",
				"红男爵",
				"红灾星",
				"妖女",
				"转换",
				"觉醒",
			) {
			countExpand++
		} else if IsExistOr(cards, "眷属", "使魔", "巫师") &&
			IsExist(cards, "欲望") {
			countExpand++
		} else if IsExistAnd(cards, "眷属", "领域") &&
			IsExistOr(
				cards,
				"影之吸血鬼",
				"公爵",
				"格蕾丝",
				"红男爵",
				"红灾星",
			) {
			countExpand++
		} else if IsExistAnd(cards, "影之吸血鬼", "领域") &&
			IsExistOr(cards, "眷属", "使魔", "巫师") {
			countExpand++
		}
	}
	chExpand <- countExpand
}

func dealBreak() {
	for i := 0; i < simulationNumber; i++ {
		cards := randomCards()

		if IsExistAnd(cards, "觉醒", "帝国") {
			countBreak++
		} else if IsExistAnd(cards, "眷属", "欲望") {
			countBreak++
		} else if IsExistAnd(cards, "眷属", "领域") &&
			IsExistOr(cards, "影之吸血鬼", "公爵") {
			countBreak++
		} else if IsExistAnd(cards, "影之吸血鬼", "领域", "欲望") &&
			IsExistOr(cards, "眷属", "使魔", "巫师") {
			countBreak++
		} else if IsExistAnd(cards, "使魔", "欲望") &&
			IsExistOr(cards, "觉醒", "帝国", "转换", "公爵") {
			countBreak++
		} else if IsExistOr(cards, "牛头鬼", "堕落") &&
			IsExist(cards, "公爵") {
			countBreak++
		} else if IsExistOr(cards, "牛头鬼", "堕落") &&
			IsExistOr(cards, "欲望", "觉醒", "帝国", "转换") &&
			IsExistOr(
				cards,
				"使魔",
				"眷属",
				"巫师",
				"影之吸血鬼",
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
	chBreak <- countBreak
}

func randomCards() []string {
	var deck = []string{
		"使魔", // 下级
		"使魔",
		"眷属",
		"眷属",
		"巫师",
		"影之吸血鬼", // 上级
		"公爵",
		"公爵",
		"格蕾丝",
		"红灾星",
		"红男爵",
		"妖女",
		"领域", // 魔法
		"帝国",
		"帝国",
		"欲望",
		"欲望",
		"欲望",
		"转换", // 陷阱
		"觉醒",
		"觉醒",
		"觉醒",
		"牛头鬼", // 支援
		"牛头鬼",
		"牛头鬼",
		"堕落",
		"堕落",
		"堕落",
		"敌人控制器", // 泛用
		"敌人控制器",
	}

	newDeck := deck
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
