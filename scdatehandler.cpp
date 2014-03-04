#include "scdatehandler.h"

#include <QString>

ScDateHandler::ScDateHandler(QObject *parent) : QObject(parent)
{
}

QString ScDateHandler::weeksTo(const QDateTime &date) const
{
    QDateTime now(QDateTime::currentDateTime());
    return QString::number(now.daysTo(date) / 7.0, 'g', 2);
}

QString ScDateHandler::daysTo(const QDateTime &date) const
{
    QDateTime now(QDateTime::currentDateTime());
    return QString::number(now.daysTo(date));
}

QString ScDateHandler::hoursTo(const QDateTime &date) const
{
    QDateTime now(QDateTime::currentDateTime());
    return QString::number(now.secsTo(date) / 3600.0, 'g', 2);
}

QString ScDateHandler::minutesTo(const QDateTime &date) const
{
    QDateTime now(QDateTime::currentDateTime());
    return QString::number(now.secsTo(date) / 60);
}

QString ScDateHandler::secondsTo(const QDateTime &date) const
{
    QDateTime now(QDateTime::currentDateTime());
    return QString::number(now.secsTo(date));
}
