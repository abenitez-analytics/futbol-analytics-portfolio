import pandas as pd
from statsbombpy import sb

# ----------------------------------
# Download matches
# ----------------------------------

competition_id = 11
season_id = 27

matches = sb.matches(
    competition_id=competition_id,
    season_id=season_id
)

# ----------------------------------
# Download events
# ----------------------------------

all_events = []

for match_id in matches.head(10)['match_id']:

    print(f"Downloading {match_id}")

    match_events = sb.events(match_id=match_id)

    all_events.append(match_events)

# ----------------------------------
# Join events
# ----------------------------------

events = pd.concat(
    all_events,
    ignore_index=True
)

# ----------------------------------
# Function
# ----------------------------------

def count_events(df, event_type, column_name):

    return (
        df[df['type'] == event_type]
        .groupby('player')
        .size()
        .reset_index(name=column_name)
    )

# ----------------------------------
# Metrics
# ----------------------------------

passes_by_player = count_events(
    events,
    'Pass',
    'passes'
)

shots_by_player = count_events(
    events,
    'Shot',
    'shots'
)

pressures_by_player = count_events(
    events,
    'Pressure',
    'pressures'
)

recoveries_by_player = count_events(
    events,
    'Ball Recovery',
    'recoveries'
)

# ----------------------------------
# xG
# ----------------------------------

shots = events[
    events['type'] == 'Shot'
]

xg_by_player = (
    shots
    .groupby('player')['shot_statsbomb_xg']
    .sum()
    .reset_index(name='xg')
)

# ----------------------------------
# Master Dataset
# ----------------------------------

player_stats = passes_by_player.copy()

player_stats = player_stats.merge(
    shots_by_player,
    on='player',
    how='outer'
)

player_stats = player_stats.merge(
    xg_by_player,
    on='player',
    how='outer'
)

player_stats = player_stats.merge(
    pressures_by_player,
    on='player',
    how='outer'
)

player_stats = player_stats.merge(
    recoveries_by_player,
    on='player',
    how='outer'
)

player_stats = player_stats.fillna(0)

# ----------------------------------
# Export
# ----------------------------------

player_stats.to_csv(
    '../data/interim/player_stats_10_matches.csv',
    index=False
)

print(player_stats.head())
print(player_stats.shape)