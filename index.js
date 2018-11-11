/* eslint-disable  func-names */
/* eslint quote-props: ["error", "consistent"]*/
/**

'use strict';
const Alexa = require('alexa-sdk');

const APP_ID = undefined;

const SKILL_NAME = 'Blank';
const GET_FACT_MESSAGE = "Here's your tip: ";
const HELP_MESSAGE = 'You can say tell me a recicling tip, or, you can say exit... What can I help you with?';
const HELP_REPROMPT = 'What can I help you with?';
const STOP_MESSAGE = 'Goodbye!';

const data = [
    'By bringing your own lunch and snacks to the office in a reusable container, you will reduce packaging waste and also spend less on going out to eat. The average worker in the US spends $37 per week on buying lunch. This can add up to $2000 per year or more.',
    'Flatten cardboard boxes so that you can fit more recyclables into your bin.',
    'All plastic bottles can be recycled, from water bottles to salad dressing, so put all of them in your recycling container.',
    'It is not just newspapers that you can recycle at home. Also, recycle wrapping paper, envelopes, birthday cards and phone books. All sorts of cardboard can be recycled, too, even toilet and paper towel tubes.',
    'Most metallic items in the home can be recycled, such as empty spray cans and tin foil, and of course, all empty soda, fruit, vegetable and other food cans.',
    'Keep a space in your cupboard so that you can recycle as you are cooking or cleaning. It will make it easier for you to put the recyclables in their proper place.',
    'Glass can be recycled endlessly; it does not wear out after several recyclings, so be sure to always recycle your glass bottles and containers.',
    'To help your recycling center and to keep down foul odors, make sure you wash food waste off of any plastic or glass food containers before putting them in the recycle bin.',
    'Think about making your household as paperless as possible. You can do a lot of work with email, electronic documents and online rather than printing out paper copies.',
    'Buy refills of products like washing detergents, coffee, hand wash and use refillable drinking bottles; it is usually cheaper.'
];

const handlers = {
    'LaunchRequest': function () {
        this.emit('GetNewFactIntent');
    },
    'GetNewFactIntent': function () {
        const factArr = data;
        const factIndex = Math.floor(Math.random() * factArr.length);
        const randomFact = factArr[factIndex];
        const speechOutput = GET_FACT_MESSAGE + randomFact;

        this.response.cardRenderer(SKILL_NAME, randomFact);
        this.response.speak(speechOutput);
        this.emit(':responseReady');
    },
    'AMAZON.HelpIntent': function () {
        const speechOutput = HELP_MESSAGE;
        const reprompt = HELP_REPROMPT;

        this.response.speak(speechOutput).listen(reprompt);
        this.emit(':responseReady');
    },
    'AMAZON.CancelIntent': function () {
        this.response.speak(STOP_MESSAGE);
        this.emit(':responseReady');
    },
    'AMAZON.StopIntent': function () {
        this.response.speak(STOP_MESSAGE);
        this.emit(':responseReady');
    },
};

exports.handler = function (event, context, callback) {
    const alexa = Alexa.handler(event, context, callback);
    alexa.APP_ID = APP_ID;
    alexa.registerHandlers(handlers);
    alexa.execute();
};
