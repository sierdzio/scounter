#ifndef SCDATEHANDLER_H
#define SCDATEHANDLER_H

#include <QObject>
#include <QDateTime>

class ScDateHandler : public QObject
{
    Q_OBJECT

public:
    explicit ScDateHandler(QObject *parent = 0);

public slots:
    QString weeksTo(const QDateTime &date) const;
    QString daysTo(const QDateTime &date) const;
    QString hoursTo(const QDateTime &date) const;
    QString minutesTo(const QDateTime &date) const;
    QString secondsTo(const QDateTime &date) const;
};

#endif // SCDATEHANDLER_H
