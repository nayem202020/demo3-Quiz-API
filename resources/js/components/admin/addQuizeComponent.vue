<template>
    <div class="container-fluid">
        <div class="row justify-content-around">
            <div class="col-12">
                <div id="accordion">
                    <h3 class="text-center" style="padding: 20px;background: #088a25; color: whitesmoke;">Add Quiz</h3>
                    <div class="card">
                        <div class="card-header">
                            <label>Quiz Title: <input class="form-control" type="text" v-model="quiz.title"></label>
                            <label>Total Mark: <input class="form-control" type="text" v-model="quiz.mark"></label>
                            <label>Total Time: <input class="form-control" type="text" v-model="quiz.time"></label>
                        </div>
                    </div>
                    <div class="card input-class" v-for="(section,sectionKey,sectionIndex) in quiz.sections"
                         :key="sectionKey">
                        <div class="card-header" >
                            <label  data-toggle="collapse" :href="'#collapseSection_'+sectionKey" >Section Title:
                                <input class="form-control" type="text"
                                       v-model="section.sectionTitle">
                            </label>
                            <button class="btn btn-primary btn-md" v-if="sectionKey == (quiz.sections.length - 1)"
                                    @click="addSection();" > Add Section +
                            </button>
                            <button class="btn btn-danger btn-md" v-if="quiz.sections.length>1"
                                    @click="removeSection(sectionKey)"> Remove Section -
                            </button>
                        </div>
                        <div :id="'collapseSection_'+sectionKey" class="collapse " data-parent="#accordion">
                            <div class="card-body">
                                <div class="all-qus-wrapper">
                                    <div class="single-qus-wrapper"
                                         v-for="(question,questionKey,questionIndex) in section.questions"
                                         :key="sectionKey+questionKey">
                                        <div class="qus">
                                            <label> Question {{ questionKey + 1 }} :
                                                <input class="form-control" type="text"
                                                       v-model="question.questionText">
                                            </label>
                                            <span>
                                                <label>
                                                   <input type="radio"
                                                          :name="'ansType_qusKey_'+questionKey+'_sectionKey_'+sectionKey"
                                                          value="single"
                                                          v-model="question.type"
                                                          @change="checkQuestionType(sectionKey,questionKey);"> single
                                                </label>
                                                <label>
                                                    <input type="radio"
                                                           :name="'ansType_qusKey_'+questionKey+'_sectionKey_'+sectionKey"
                                                           value="multiple"
                                                           v-model="question.type"
                                                           @change="checkQuestionType(sectionKey,questionKey);"> Multiple
                                                </label>
                                            </span>
                                            <button class="btn btn-success btn-sm"
                                                    v-if="questionKey == (section.questions.length - 1)"
                                                    @click="addQuestion(sectionKey)"> Add Questions +
                                            </button>
                                            <button class="btn btn-danger btn-sm" v-if="section.questions.length>1"
                                                    @click="removeQuestion(sectionKey,questionKey)"> Remove Questions -
                                            </button>
                                        </div>
                                        <div class="options ml-6">
                                            <div class="single">
                                                <div class="single-option"
                                                     v-for="(option,optionKey,optionIndex) in question.options"
                                                     :key="sectionKey+questionKey+optionKey">
                                                    <label>Option {{ optionKey + 1 }} :
                                                        <input class="form-control" v-model="option.optionText"
                                                               type="text">
                                                    </label>
                                                    <span>
                                                        <label>
                                                        <input type="radio"
                                                               v-if="question.type==='single'"
                                                               v-model="question.rightAnswer[0]"
                                                               :value="optionKey+1"
                                                               :name="'optionCorrect_'+optionKey+'_qusKey_'+questionKey+'_sectionKey_'+sectionKey">
                                                        <input type="checkbox"
                                                               v-if="question.type==='multiple'"
                                                               v-model="question.rightAnswer"
                                                               :value="optionKey+1"
                                                               :name="'optionCorrect_'+optionKey+'_qusKey_'+questionKey+'_sectionKey_'+sectionKey"> Mark as correct answer
                                                        </label>
                                                    </span>
                                                    <button class="btn btn-secondary btn-xs"
                                                            v-if="optionKey == (question.options.length - 1)"
                                                            @click="addOption(sectionKey,questionKey)"> +
                                                    </button>
                                                    <button class="btn btn-danger btn-xs"
                                                            v-if="question.options.length>1"
                                                            @click="removeOption(sectionKey,questionKey,optionKey)"> -
                                                    </button>
                                                </div>
                                            </div>

                                            <div class="correct_ans">
                                                <p class="text-blue" v-if="question.rightAnswer.length">Correct Answer:
                                                    [<span v-for=" (ra,ansKey,ansIndex) in question.rightAnswer">

                                                    <b v-if="ansKey == (question.rightAnswer.length - 1)">{{ ra }}</b>
                                                    <b v-else>{{ ra + ',' }}</b>
                                                    </span>]
                                                </p>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div @click="quizSubmit()" class="text-center btn-primary">
                    <button class="btn btn-lg btn-primary">Submit</button>
                </div>
            </div>
        </div>

        <vue-progress-bar></vue-progress-bar>
        <vue-snotify></vue-snotify>
    </div>
</template>

<script>
export default {
    name: "addQuizeComponent",
    created() {
    },
    mounted() {
    },
    data() {
        return {
            quiz: {
                title: 'Programming Quiz',
                time: '30 min',
                mark: '20',
                sections: [
                    {
                        sectionTitle: 'Php',
                        questions: [
                            {
                                questionText: 'What does PEAR stand for?',
                                type: 'single',
                                options: [
                                    {optionText: 'option 1 '},
                                ],
                                rightAnswer: [],
                            },
                        ]
                    },
                ]
            },
        }
    },
    watch: {},
    computed: {},
    methods: {
        checkQuestionType(sectionKey, questionKey) {
            if (this.quiz.sections[sectionKey].questions[questionKey].type === 'single') {
                this.quiz.sections[sectionKey].questions[questionKey].rightAnswer.splice(1)
            }
        },
        quizSubmit() {
            axios.post("/api/add_quiz", {'quiz': this.quiz,})
                .then((res) => {
                    console.log(res);
                    this.quiz.sections.splice(0);
                    this.quiz.sections.push({
                        sectionTitle: '',
                        questions: [
                            {
                                questionText: '',
                                type: 'single',
                                options: [
                                    {optionText: ''},
                                ],
                                rightAnswer: [],
                            },
                        ]
                    },)
                }).catch((e) => {
                console.log(e)

            })
        },
        addSection() {
            this.quiz.sections.push(
                {
                    sectionTitle: 'Java',
                    questions: [
                        {
                            questionText: 'Question 1??',
                            type: 'single',
                            options: [
                                {optionText: 'option 1'},
                            ],
                            rightAnswer: [],
                        },
                    ]
                },);

        },
        removeSection(sectionKey) {
            this.$delete(this.quiz.sections, sectionKey); //for vue object
        },
        addQuestion(sectionKey) {
            this.quiz.sections[sectionKey].questions.push({
                questionText: 'Question 2',
                type: 'single',
                options: [{optionText: 'option 1'},],
                rightAnswer: [],
            },);
        },
        removeQuestion(sectionKey, questionKey) {
            this.$delete(this.quiz.sections[sectionKey].questions, questionKey); //for vue object
        },
        addOption(sectionKey, questionKey) {
            //console.log(sectionKey, questionKey);
            this.quiz.sections[sectionKey].questions[questionKey].options.push({optionText: 'new option'},);
            //this.quiz.sections[sectionKey].questions[questionKey].options.unshift({optionText: ''},);

        },
        removeOption(sectionKey, questionKey, optionKey) {
            //console.log(sectionKey, questionKey, optionKey);
            //this.quiz.sections[sectionKey].questions[questionKey].options.splice(optionKey, 1); // array
            //this.cities.splice(this.cities.indexOf(city), 1);
            this.$delete(this.quiz.sections[sectionKey].questions[questionKey].options, optionKey); //for vue object
        },
    }
}
</script>

<style scoped>
.options {
    margin-left: 135px;
    margin-top: 20px;
}

input[type="text"] {
    width: 300px;;
}

.input-class input[type="text"] {
    width: 400px;;
}

.qus input[type="text"] {
    width: 350px;;
}

.single-option input[type="text"] {
    width: 250px;;
}

</style>
