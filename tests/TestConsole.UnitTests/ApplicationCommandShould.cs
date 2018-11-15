﻿using System;
using System.Collections.Generic;
using System.Linq;
using AutoFixture;
using Git.Domain;
using Git.Domain.Models.TFL;
using Moq;
using Moq.AutoMock;
using Xunit;
using static Git.Domain.Constants.AccidentStatisticSorting;

namespace TestConsole.UnitTests
{
    public class ApplicationCommandShould
    {
        private readonly AutoMocker _autoMocker;
        private readonly ApplicationCommand _subject;
        private readonly Paged<AccidentStatistic> _pagedAccidentResponse;
        private readonly Mock<ITransportForLondonClient> _transportForLondonClientMock;
        private readonly Fixture _autoFixture;
        private readonly Mock<ILogger> _loggerMock;

        public ApplicationCommandShould()
        {
            _autoMocker = new AutoMocker();
            _autoFixture = new Fixture();
            _subject = _autoMocker.CreateInstance<ApplicationCommand>();
            var data = new[] { _autoFixture.Build<AccidentStatistic>()
                        .With(x => x.DateAsString, new DateTime(2017,03,03).ToString("yyyy-MM-ddTHH:mm:ssZ"))
                        .Create()};
            _pagedAccidentResponse = CreatePagedAccidentStatistic(data, 1, 1);
            _transportForLondonClientMock = _autoMocker.GetMock<ITransportForLondonClient>();
            _transportForLondonClientMock.Setup(x => x.GetAccidentStatistics(
                It.IsAny<DateTime>(), It.IsAny<DateTime>(), It.IsAny<Severity>(),
                It.IsAny<SortOptions<AccidentStatistic>>(), It.IsAny<int>(), It.IsAny<int>()))
            .ReturnsAsync(() => _pagedAccidentResponse);
            _loggerMock = _autoMocker.GetMock<ILogger>();
            _loggerMock.Setup(x => x.AsInformation(It.IsAny<string>()));
        }

        [Fact]
        public void CallTransportForLondonClientToGetFatalAccidentStatisticsForJan2014()
        {
            _subject.Execute();

            _transportForLondonClientMock.Verify(x => x.GetAccidentStatistics(
                DateTime.Parse("01 January 2014 00:00:00"),
                DateTime.Parse("31 December 2017 00:00:00"),
                Severity.Fatal,
                ByDateDescending,
                1,
                20));
        }

        [Fact]
        public void LogInformationAboutHowManyFatalAccidentsOccured()
        {
            _subject.Execute();

            _loggerMock.Verify(x => x.AsInformation($"{_pagedAccidentResponse.Total} fatal accidents occured"));
        }

        [Fact]
        public void LogInformationPageInformation()
        {
            _subject.Execute();

            _loggerMock.Verify(x => x.AsInformation($"Page '{_pagedAccidentResponse.Page}' of '{_pagedAccidentResponse.LastPage}' pages with 20 records"));
        }

        private static Paged<AccidentStatistic> CreatePagedAccidentStatistic(IEnumerable<AccidentStatistic> data, int page = 1, int lastPage = 1)
        {
            return Paged<AccidentStatistic>.Create(data.Count(), data, page, data.Count(), lastPage);
        }
    }
}